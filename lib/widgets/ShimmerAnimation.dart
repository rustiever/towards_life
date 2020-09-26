import 'package:flutter/material.dart';

class Shimmer extends StatefulWidget {
  final Widget child;

  const Shimmer({@required this.child, Key key}) : super(key: key);

  @override
  _ShimmerState createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.child,
        Positioned.fill(
          child: ClipRect(
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return FractionallySizedBox(
                  widthFactor: .2,
                  alignment: AlignmentGeometryTween(
                    begin: const Alignment(-1.0 - .2 * 3, .0),
                    end: Alignment(1.0 + .2 * 3, .0),
                  )
                      .chain(
                        CurveTween(curve: Curves.easeInSine),
                      )
                      .evaluate(controller),
                  child: child,
                );
              },
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      // Color.fromARGB(0, 255, 255, 255),
                      Colors.blueGrey,
                      Colors.black12,
                      Colors.blueGrey,
                      Colors.black12,
                      // Color.fromARGB(0, 255, 255, 255),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
