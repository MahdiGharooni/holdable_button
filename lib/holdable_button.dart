import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:holdable_button/my_painter.dart';

class HoldableButton extends StatefulWidget {
  const HoldableButton({
    super.key,
    required this.buttonColor,
    required this.loadingColor,
    required this.duration,
    required this.radius,
    required this.onConfirm,
    required this.child,
    required this.strokeWidth,
    required this.width,
    required this.height,
    this.startPoint = 0,
    this.resetAfterFinish = false,
    this.hasVibrate = false,
    this.margin,
    this.padding,
  });

  final Color buttonColor;
  final Color loadingColor;
  final int duration;
  final double width;
  final double height;
  final double radius;
  final double strokeWidth;
  final double startPoint;
  final Function onConfirm;
  final Widget child;
  final bool resetAfterFinish;
  final bool hasVibrate;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  State<HoldableButton> createState() => _CrossLineContainerState();
}

class _CrossLineContainerState extends State<HoldableButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  AnimationStatus? _animationStatus;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.duration),
    )..addStatusListener((status) {
        _animationStatus = status;
        if (status == AnimationStatus.completed) {
          _vibrate();
          widget.onConfirm.call();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (details) {
        _controller.value = 0;
        _controller.forward(from: 0);
      },
      onLongPressEnd: (details) {
        if (_animationStatus != AnimationStatus.completed) {
          _controller.reset();
        } else if (widget.resetAfterFinish &&
            _animationStatus == AnimationStatus.completed) {
          _controller.reset();
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            size: Size(widget.width, widget.height),
            painter: MyPainter(
              _controller.value,
              widget.radius,
              widget.loadingColor,
              widget.strokeWidth,
              widget.startPoint,
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
      ),
    );
  }

  Future<void> _vibrate() async {
    if (widget.hasVibrate) {
      await SystemChannels.platform
          .invokeMethod<void>('HapticFeedback.vibrate');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
