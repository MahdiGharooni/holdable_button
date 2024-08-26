
import 'package:flutter/material.dart';
import 'package:holdable_button/holdable_button.dart';

class FillingLoadingAnimation extends StatelessWidget {
  const FillingLoadingAnimation(this.widget, this.controller,this.progressAnimation, {super.key});

  final HoldableButton widget;
  final AnimationController controller;

  final Animation<double> progressAnimation;
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: controller.isCompleted,
      child: AnimatedOpacity(
        opacity: 1.0,
        duration: Duration(seconds: widget.duration),
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: widget.beginFillingPoint,
                  end: widget.endFillingPoint,
                  colors: [
                    widget.loadingColor.withOpacity(0.3),
                    Colors.transparent
                  ],
                  stops: [progressAnimation.value, progressAnimation.value],
                ).createShader(rect);
              },
              child: child,
            );
          },
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
        ),
      ),
    );
  }
}