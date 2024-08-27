import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:holdable_button/utils/utils.dart';
import 'package:holdable_button/widgets/edge_loading_animation.dart';
import 'package:holdable_button/widgets/filling_loading_animation.dart';

class HoldableButton extends StatefulWidget {
  const HoldableButton({
    super.key,
    required this.loadingType,
    required this.buttonColor,
    required this.loadingColor,
    required this.duration,
    required this.radius,
    required this.onConfirm,
    required this.child,
    required this.strokeWidth,
    required this.width,
    required this.height,
    this.edgeLoadingStartPoint = 0,
    this.resetAfterFinish = false,
    this.reverseAfterLongPressUp = true,
    this.hasVibrate = false,
    this.beginFillingPoint = Alignment.centerRight,
    this.endFillingPoint = Alignment.centerLeft,
    this.margin,
    this.padding,
  });

  final LoadingType loadingType;
  final Color buttonColor;
  final Color loadingColor;
  final int duration;
  final double width;
  final double height;
  final double radius;
  final double strokeWidth;
  final double edgeLoadingStartPoint;
  final Function onConfirm;
  final Widget child;
  final bool resetAfterFinish;
  final bool reverseAfterLongPressUp;
  final bool hasVibrate;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry beginFillingPoint;
  final AlignmentGeometry endFillingPoint;

  @override
  State<HoldableButton> createState() => _CrossLineContainerState();
}

class _CrossLineContainerState extends State<HoldableButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  AnimationStatus? _animationStatus;
  late Animation<double> _progressAnimation;

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

    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPressStart: (details) {
          if (_animationStatus == null) {
            _controller.value = 0;
            _controller.forward(from: 0);
          }
        },
        onLongPressEnd: (details) {
          if (_animationStatus != AnimationStatus.completed) {
            if (widget.reverseAfterLongPressUp) {
              _controller.reverse();
            } else {
              _controller.reset();
            }
          } else if (widget.resetAfterFinish &&
              _animationStatus == AnimationStatus.completed) {
            _controller.reset();
          }
        },
        child: widget.loadingType == LoadingType.fillingLoading
            ? FillingLoadingAnimation(widget, _controller, _progressAnimation)
            : EdgeLoadingAnimation(widget, _controller));
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
