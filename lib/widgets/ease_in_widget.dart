import 'package:flutter/material.dart';

class EaseInWidget extends StatefulWidget {
  final String image;
  final String secondImage;
  final Function onTap;
  final double radius;

  const EaseInWidget(
      {Key key,
      @required this.image,
      @required this.secondImage,
      @required this.onTap,
      @required this.radius})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _EaseInWidgetState();
}

class _EaseInWidgetState extends State<EaseInWidget>
    with TickerProviderStateMixin<EaseInWidget> {
  AnimationController controller;
  Animation<double> easeInAnimation;
  // Animation _colorTween;
  bool _selected = false;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      value: 0.1,
    );
    easeInAnimation = Tween(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    // _colorTween =
    //     ColorTween(begin: Colors.red, end: Colors.green).animate(controller);
    // controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        if (widget.onTap == null) {
          return;
        }
        setState(() {
          _selected = true;
        });
        controller.forward().then((val) {});
      },
      onTapUp: (TapUpDetails details) {
        if (widget.onTap == null) {
          return;
        }
        controller.reverse().then((val) {
          widget.onTap();
        });
        setState(() {
          _selected = false;
        });
      },
      onTapCancel: () {
        controller.forward().then((val) {
          controller.reverse().then((val) {
            widget.onTap();
            setState(() {
              _selected = false;
            });
          });
        });
      },
      child: ScaleTransition(
        scale: easeInAnimation,
        child: Material(
          child: CircleAvatar(
            radius: size.height > 550 ? 50 : widget.radius,
            backgroundColor: Colors.transparent,
            child: Image.asset(
              _selected ? widget.secondImage : widget.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
