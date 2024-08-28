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

  /// The loading type from enum { edgeLoading, fillingLoading }
  final LoadingType loadingType;
  final Color buttonColor;
  final Color loadingColor;
  final int duration;
  final double width;
  final double height;
  final double radius;
  final double strokeWidth;
  final Function onConfirm;
  final Widget child;
  final bool hasVibrate;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  /// after longPressUp, if this value is true, it will reverse the loading in the path that it is passed
  /// if this value is false, the loading will stop suddenly
  /// the default value is true
  final bool reverseAfterLongPressUp;

  /// after loading complete, if this value is true, it will reset the loading and enable it again
  /// the false value, keep the loading completed, and not allow to start again
  /// the default value is false
  final bool resetAfterFinish;

  /// The start point of loading in edgeLoading type
  /// the default value is 0
  final double edgeLoadingStartPoint;

  /// Side of start loading in FillingLoading type
  /// It can be Alignment.centerRight, Alignment.centerLeft, Alignment.topCenter or etc.
  /// The default value is Alignment.centerRight.
  final AlignmentGeometry beginFillingPoint;

  /// Side of end loading in FillingLoading type
  /// It can be Alignment.centerRight, Alignment.centerLeft, Alignment.topCenter or etc.
  /// The default value is Alignment.centerLeft.
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
          _controller.value = 0;
          _controller.forward(from: 0);
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
