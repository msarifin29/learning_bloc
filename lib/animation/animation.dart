import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomAnimation1 extends StatefulWidget {
  const CustomAnimation1({super.key, required this.child});
  final Widget child;
  @override
  State<CustomAnimation1> createState() => _CustomAnimation1State();
}

class _CustomAnimation1State extends State<CustomAnimation1>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform(
          transform: Matrix4.skewY(0.1)
            ..rotateY(_controller.value * 2 * math.pi),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class CustomAnimation2 extends StatefulWidget {
  const CustomAnimation2({super.key, required this.child});
  final Widget child;
  @override
  State<CustomAnimation2> createState() => _CustomAnimation2State();
}

class _CustomAnimation2State extends State<CustomAnimation2>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.skewX(0.2)
              ..rotateX(_controller.value * 2 * math.pi),
            child: child,
          );
        },
        child: widget.child);
  }
}

class CustomAnimation3 extends StatefulWidget {
  const CustomAnimation3({super.key, required this.child});

  final Widget child;
  @override
  State<CustomAnimation3> createState() => _CustomAnimation3State();
}

class _CustomAnimation3State extends State<CustomAnimation3>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform(
          transform: Matrix4.skewY(0.1)
            ..rotateZ(_controller.value * 2 * math.pi),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class CustomAnimation4 extends StatefulWidget {
  const CustomAnimation4({super.key, required this.child});
  final Widget child;
  @override
  State<CustomAnimation4> createState() => _CustomAnimation4State();
}

class _CustomAnimation4State extends State<CustomAnimation4>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.rotationZ(2.0)
              ..rotateZ(_controller.value * 2 * math.pi),
            child: child,
          );
        },
        child: widget.child);
  }
}
