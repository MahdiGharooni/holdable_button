import 'package:flutter/material.dart';
import 'package:holdable_button/holdable_button.dart';
import 'package:holdable_button/my_painter.dart';

class EdgeLoadingAnimation extends StatelessWidget {
  const EdgeLoadingAnimation(this.widget, this.controller, {super.key});

  final HoldableButton widget;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(widget.width, widget.height),
          painter: MyPainter(
            controller.value,
            widget.radius,
            widget.loadingColor,
            widget.strokeWidth,
            widget.edgeLoadingStartPoint,
          ),
          child: Container(
            width: widget.width,
            height: widget.height,
            alignment: Alignment.center,
            margin: widget.margin,
            padding: widget.padding,
            decoration: BoxDecoration(
              color: widget.buttonColor,
              borderRadius: BorderRadius.circular(widget.radius),
            ),
            child: widget.child,
          ),
        );
      },
    );
  }
}
