import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kiosk/jayne/components/molecules/events/avatar_circle.dart';
import 'package:kiosk/jayne/controllers/send_message_stream.dart';
import 'package:kiosk/jayne/enhances/responsive_image.dart';

class TypingAnimation extends StatefulWidget {
  final SendMessageStream typingController;
  final Color bubbleColor;
  final Color flashingCircleDarkColor;
  final Color flashingCircleBrightColor;
  final AssetType assetType;
  final String imageName;

  const TypingAnimation({
    super.key,
    required this.typingController,
    this.bubbleColor = const Color(0xFFFFFFFF),
    this.flashingCircleDarkColor = const Color(0xFF333333),
    this.flashingCircleBrightColor = const Color(0xFFaec1dd),
    required this.assetType,
    required this.imageName,
  });

  @override
  State<TypingAnimation> createState() => _TypingAnimationState();
}

late AnimationController appearanceController;
late Animation<double> indicatorSpaceAnimation;
late AnimationController repeatingController;

class _TypingAnimationState extends State<TypingAnimation> with TickerProviderStateMixin {
  late Animation<double> _largeBubbleAnimation;
  final List<Interval> _dotIntervals = const [
    Interval(0.25, 0.8),
    Interval(0.35, 0.9),
    Interval(0.45, 1.0),
  ];

  @override
  void initState() {
    super.initState();

    appearanceController = AnimationController(
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    indicatorSpaceAnimation = CurvedAnimation(
      parent: appearanceController,
      curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      reverseCurve: const Interval(0.0, 1.0, curve: Curves.easeOut),
    ).drive(Tween<double>(
      begin: 0.0,
      end: 60.0,
    ));

    _largeBubbleAnimation = CurvedAnimation(
      parent: appearanceController,
      curve: const Interval(0.3, 1.0, curve: Curves.elasticOut),
      reverseCurve: const Interval(0.5, 1.0, curve: Curves.easeOut),
    );

    repeatingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    showIndicator();
  }

  @override
  void dispose() {
    appearanceController.dispose();
    repeatingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: indicatorSpaceAnimation,
      builder: (context, child) {
        return SizedBox(
          height: indicatorSpaceAnimation.value,
          child: child,
        );
      },
      child: Stack(
        children: [
          AnimatedBubble(
            animation: _largeBubbleAnimation,
            left: 12,
            top: 12,
            bubble: StatusBubble(
              repeatingController: repeatingController,
              dotIntervals: _dotIntervals,
              flashingCircleDarkColor: widget.flashingCircleDarkColor,
              flashingCircleBrightColor: widget.flashingCircleBrightColor,
              bubbleColor: widget.bubbleColor,
              imageName: widget.imageName,
              assetType: widget.assetType,
            ),
          ),
        ],
      ),
    );
  }
}

void showIndicator() {
  appearanceController
    ..duration = const Duration(milliseconds: 750)
    ..forward();
  repeatingController.repeat();
}

void hideTypingAnimation() {
  if (appearanceController.isAnimating) {
    appearanceController
      ..duration = const Duration(milliseconds: 150)
      ..reverse();
    repeatingController.stop();
  }
}

class CircleBubble extends StatelessWidget {
  const CircleBubble({
    super.key,
    required this.size,
    required this.bubbleColor,
  });

  final double size;
  final Color bubbleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bubbleColor,
      ),
    );
  }
}

class AnimatedBubble extends StatelessWidget {
  const AnimatedBubble({
    super.key,
    required this.animation,
    required this.left,
    required this.top,
    required this.bubble,
  });

  final Animation<double> animation;
  final double left;
  final double top;
  final Widget bubble;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, -animation.value),
            child: child,
          );
        },
        child: bubble,
      ),
    );
  }
}

class StatusBubble extends StatelessWidget {
  const StatusBubble({
    super.key,
    required this.repeatingController,
    required this.dotIntervals,
    required this.flashingCircleBrightColor,
    required this.flashingCircleDarkColor,
    required this.bubbleColor,
    required this.assetType,
    required this.imageName,
  });

  final AnimationController repeatingController;
  final List<Interval> dotIntervals;
  final Color flashingCircleDarkColor;
  final Color flashingCircleBrightColor;
  final Color bubbleColor;
  final AssetType assetType;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Container(
                width: 85,
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  color: bubbleColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlashingCircle(
                      index: 0,
                      repeatingController: repeatingController,
                      dotIntervals: dotIntervals,
                      flashingCircleDarkColor: flashingCircleDarkColor,
                      flashingCircleBrightColor: flashingCircleBrightColor,
                    ),
                    FlashingCircle(
                      index: 1,
                      repeatingController: repeatingController,
                      dotIntervals: dotIntervals,
                      flashingCircleDarkColor: flashingCircleDarkColor,
                      flashingCircleBrightColor: flashingCircleBrightColor,
                    ),
                    FlashingCircle(
                      index: 2,
                      repeatingController: repeatingController,
                      dotIntervals: dotIntervals,
                      flashingCircleDarkColor: flashingCircleDarkColor,
                      flashingCircleBrightColor: flashingCircleBrightColor,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 5,
              bottom: 0,
              child: AvatarCircle(
                assetType: assetType,
                imageName: imageName,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FlashingCircle extends StatelessWidget {
  const FlashingCircle({
    super.key,
    required this.index,
    required this.repeatingController,
    required this.dotIntervals,
    required this.flashingCircleBrightColor,
    required this.flashingCircleDarkColor,
  });

  final int index;
  final AnimationController repeatingController;
  final List<Interval> dotIntervals;
  final Color flashingCircleDarkColor;
  final Color flashingCircleBrightColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: repeatingController,
      builder: (context, child) {
        final circleFlashPercent = dotIntervals[index].transform(
          repeatingController.value,
        );
        final circleColorPercent = sin(pi * circleFlashPercent);

        // Add a vertical jump animation with different delays for each circle
        final verticalJumpAnimation = CurvedAnimation(
          parent: repeatingController,
          curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
        ).drive(Tween<double>(
          begin: 0.0,
          end: 10.0, // Adjust the jump height as needed
        ));

        // Apply different delays to create alternating motion
        final delay = 0.3 * index; // Adjust the delay factor as needed

        return Container(
          width: 9,
          height: 9,
          // Apply translation with delay
          transform: Matrix4.translationValues(
            0.0,
            -verticalJumpAnimation.value * sin(2 * pi * (repeatingController.value - delay)),
            0.0,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.lerp(
              flashingCircleDarkColor,
              flashingCircleBrightColor,
              circleColorPercent,
            ),
          ),
        );
      },
    );
  }
}
