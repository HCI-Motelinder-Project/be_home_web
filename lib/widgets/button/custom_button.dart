import 'package:behome/constraint/color_constant.dart';
import 'package:behome/constraint/text_style_constant.dart';
import 'package:behome/views/home/home_view.dart';
import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final double height;
  final double width;
  final String text;
  final Color animationColor;

  const AnimatedButton(this.height, this.width, this.text, this.animationColor);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late Color textColor;
  late Color borderColor;
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    textColor = widget.animationColor;
    borderColor = Colors.white;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1000.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: widget.height,
        width: widget.width,
        child: Material(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(
                color: appMainColor,
                width: 2,
              )),
          child: InkWell(
            onTap: () {},
            onHover: (value) {
              if (value) {
                _controller.forward();
                setState(() {
                  textColor = Colors.white;
                  borderColor = widget.animationColor;
                });
              } else {
                _controller.reverse();
                setState(() {
                  textColor = widget.animationColor;
                  borderColor = Colors.white;
                });
              }
            },
            child: Container(
              color: Colors.white,
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: widget.animationColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      width: _animation.value,
                    ),
                  ),
                  Center(
                    child: AnimatedDefaultTextStyle(
                      child: Text(
                        widget.text,
                        style: navbarButton,
                      ),
                      style: TextStyle(color: textColor),
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NormalButton extends StatefulWidget {
  final String title;

  const NormalButton(this.title);

  @override
  _NormalButtonState createState() => _NormalButtonState();
}

class _NormalButtonState extends State<NormalButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => HomeView()));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: navbarText),
        ],
      ),
    );
  }
}

class CustomIconButton extends StatefulWidget {
  final String title;
  final IconData icon;
  final String image;

  const CustomIconButton(this.title, this.icon, this.image);

  @override
  _CustomIconButtonState createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                widget.title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                    color: Colors.white),
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
