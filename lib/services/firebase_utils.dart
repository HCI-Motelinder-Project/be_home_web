import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';
import 'package:behome/models/user_response_model.dart';
import 'package:behome/presenters/user_presenter.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';

class FirebaseAuthUtils {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Singleton setup: prevents multiple instances of this class.
  FirebaseAuthUtils._();

  static final FirebaseAuthUtils _service = FirebaseAuthUtils._();

  factory FirebaseAuthUtils() => _service;

  static FirebaseAuthUtils get instance => _service;

  Stream<User> authStateChanges() => _firebaseAuth.authStateChanges();

  User get currentUser => _firebaseAuth.currentUser;

  Future<UserResponseModel> signInByGoogle() async {

    GoogleAuthProvider authProvider = GoogleAuthProvider();
    try {
      if (currentUser != null) {
        await signOut();
      }
      final UserCredential userCredential =
          await _firebaseAuth.signInWithPopup(authProvider);

      String accessToken = await userCredential.user.getIdToken();
      String googleId = userCredential.user.uid;

      return await checkLogin(accessToken, googleId);
    } on FirebaseAuthException catch (e) {
      print(e.stackTrace);
      return null;
    } catch (e) {
      print(e.stackTrace);
      return null;
    }
    return null;
  }

  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
