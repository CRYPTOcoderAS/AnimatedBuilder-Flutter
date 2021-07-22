import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:random_pk/random_pk.dart';

class AnimatedBuilderExample extends StatefulWidget {
  @override
  _AnimatedBuilderExampleState createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 10), vsync: this)
          ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RandomContainer(
          height: 200.0,
          width: 200.0,
          child: AnimatedBuilder(
              animation: _animationController,
              child: Container(
                height: 50.0,
                width: 50.0,
                color: Colors.red,
              ),
              builder: (context, child) => Transform.rotate(
                    child: child,
                    angle: _animationController.value * 2.0 * math.pi,
                  )),
        ),
      ),
    );
  }
}
