import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';
import 'package:behome/config/config.dart';
import 'package:behome/models/user_model.dart';
import 'package:behome/models/user_response.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Singleton setup: prevents multiple instances of this class.
  AuthService._();
  static final AuthService _service = AuthService._();
  factory AuthService() => _service;

  static AuthService get instance => _service;

  Stream<User> authStateChanges() => _firebaseAuth.authStateChanges();

  User get currentUser => _firebaseAuth.currentUser;

  Future<User> signInAnonymously() async {
    try {
      final userCredential = await _firebaseAuth.signInAnonymously();
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print(e.stackTrace);
    } catch (e) {
      print(e.stackTrace);
    }
  }

  Future<User> signInWithEmailAndPassword({
    String email,
    String password,
  }) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(
        EmailAuthProvider.credential(email: email, password: password),
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print(e.stackTrace);
        return null;
      } else if (e.code == 'wrong-password') {
        print(e.stackTrace);
        return null;
      } else {
        print(e.stackTrace);
        return null;
      }
    } catch (e) {
      print(e.stackTrace);
    }
  }

  Future<void> sendPasswordResetEmail({
    String email,
  }) async {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> deleteUser() {
    return currentUser?.delete();
  }

  Future<void> updatePassword({
    String newPassword,
  }) {
    currentUser?.updatePassword(newPassword);
  }

  Future<void> updateProfile({
    String photoURL,
    String displayName,
  }) {
    currentUser?.updateProfile(
      photoURL: photoURL,
      displayName: displayName,
    );
  }

  Future<User> createUserWithEmailAndPassword({
    String email,
    String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print(e.stackTrace);
        return null;
      } else if (e.code == 'email-already-in-use') {
        return null;
      } else {
        print(e.stackTrace);
        return null;
      }
    } catch (e) {
      print(e.stackTrace);
      return null;
    }
  }

  Future<String> signInWithPhoneNumber(String phone) async {
    try {
      final ConfirmationResult confirmationResult =
          await _firebaseAuth.signInWithPhoneNumber(phone);

      return confirmationResult.verificationId;
    } catch (e) {
      print(e.stackTrace);
      return null;
    }
  }

  Future<UserResponse> signInByGoogle() async {
    try {
      await signOut();
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: [
          'https://www.googleapis.com/auth/userinfo.email',
          'https://www.googleapis.com/auth/userinfo.profile',
        ],
      );
      final GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
      if (_googleUser != null) {
        final _googleAuth = await _googleUser.authentication;
        final userCredential = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
            idToken: _googleAuth.idToken,
            accessToken: _googleAuth.accessToken,
          ),
        );
        var request = {
          "accessToken": await userCredential.user.getIdToken(),
          "googleId": userCredential.user.uid
        };
        var url = '$API_URL/user/login';
        final response = await new Dio().post(url,
            options: Options(
                headers: {HttpHeaders.contentTypeHeader: 'application/json'}),
            data: jsonEncode(request));
        if (response == null) {
          return null;
        }
        if (response.statusCode == 200) {
          Map<String, dynamic> map = Map<String, dynamic>.from(response.data);
          UserResponse user = UserResponse(
            statusCode: response.statusCode,
            user: UserModel.fromJson(map),
          );
          return user;
        } else if (response.statusCode == 201) {
          User ggUser = FirebaseAuth.instance.currentUser;
          UserResponse user = UserResponse(
            statusCode: response.statusCode,
            user: new UserModel(
              email: ggUser.email,
              name: ggUser.displayName,
              image: ggUser.photoURL,
            ),
          );
          return user;
        } else {
          return null;
        }
      }
    } on FirebaseAuthException catch (e) {
      print(e.stackTrace);
      return null;
    } catch (e) {
      print(e.stackTrace);
      return null;
    }
    return null;
  }

  Future<UserModel> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: [
          'https://www.googleapis.com/auth/userinfo.email',
          'https://www.googleapis.com/auth/userinfo.profile',
        ],
      );
      final GoogleSignInAccount googleUser = await googleSignIn.signIn();
      // sign in process was aborted
      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;
        final userCredential = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken,
          ),
        );
        var request = {
          "accessToken": await FirebaseAuth.instance.currentUser.getIdToken(),
          "googleId": FirebaseAuth.instance.currentUser.uid
        };
        var url = '$API_URL/user/login';
        final response = await new Dio().post(url,
            options: Options(
                headers: {HttpHeaders.contentTypeHeader: 'application/json'}),
            data: jsonEncode(request));
        if (response.statusCode == 200) {
          dev.log("OK");
          Map<String, dynamic> map = Map<String, dynamic>.from(response.data);
          UserModel user = UserModel.fromJson(map);
          return user;
        } else if (response.statusCode == 201) {
          dev.log("201");
          return new UserModel(
              email: FirebaseAuth.instance.currentUser.email,
              name: FirebaseAuth.instance.currentUser.displayName);
        } else {
          throw Exception(
              'Failed to load rent items from API:  ${response.toString()}');
        }
      }
    } on FirebaseAuthException catch (e) {
      print(e.stackTrace);
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }

  Future<UserModel> registerUser(UserModel userModel) async {
    final dateFormat = DateFormat("yyyy-MM-dd");
    var request = {
      "accessToken": await FirebaseAuth.instance.currentUser.getIdToken(true),
      "user": {
        "email": userModel.email.trim(),
        "phone": userModel.phone.trim(),
        "fullname": userModel.name.trim(),
        "dateOfBirth": dateFormat.format(userModel.dateOfBirth).trim(),
        "status": userModel.status.trim(),
        "roleId": userModel.roleId.trim(),
        "image": userModel.image.trim(),
      }
    };
    var url = '$API_URL/user/register';

    final response = await new Dio().post(url,
        options: Options(
            headers: {HttpHeaders.contentTypeHeader: 'application/json'}),
        data: jsonEncode(request));
    if (response.statusCode == 200) {
      Map<String, dynamic> map = Map<String, dynamic>.from(response.data);
      UserModel user = UserModel.fromJson(map);
      return user;
    } else {
      return null;
    }
  }

  Future<UserModel> registerWithGoogle(UserModel userModel) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: [
          'https://www.googleapis.com/auth/userinfo.email',
          'https://www.googleapis.com/auth/userinfo.profile',
        ],
      );
      final GoogleSignInAccount googleUser = await googleSignIn.signIn();
      final dateFormat = DateFormat("yyyy-MM-dd");
      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;
        final userCredential = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken,
          ),
        );
        var request = {
          "accessToken":
              await FirebaseAuth.instance.currentUser.getIdToken(true),
          "user": {
            "email": userModel.email.trim(),
            "phone": userModel.phone.trim(),
            "fullname": userModel.name.trim(),
            "dateOfBirth": dateFormat.format(userModel.dateOfBirth).trim(),
            "status": userModel.status.trim(),
            "roleId": userModel.roleId.trim(),
            "image": userModel.image.trim(),
          }
        };
        var url = '$API_URL/user/register';
        dev.log(request.toString());

        final response = await new Dio().post(url,
            options: Options(
                headers: {HttpHeaders.contentTypeHeader: 'application/json'}),
            data: jsonEncode(request));
        if (response.statusCode == 200) {
          dev.log("OK");
          Map<String, dynamic> map = Map<String, dynamic>.from(response.data);
          UserModel user = UserModel.fromJson(map);
          return user;
        } else {
          dev.log("Long khùng");
          throw Exception(
              'Failed to load rent items from API:  ${response.toString()}');
        }
      }
    } on FirebaseAuthException catch (e) {
      print(e.stackTrace);
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
