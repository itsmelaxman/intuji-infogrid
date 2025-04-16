import 'package:flutter/material.dart';
import 'package:intuji_infogrid/src/src.dart';

class CustomLoader extends StatefulWidget {
  final Duration duration;
  final double size;

  const CustomLoader({
    super.key,
    this.size = 100.0,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<CustomLoader> createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          RotationTransition(
            turns: _animationController,
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: SweepGradient(
                  colors: [
                    AppColors.kSuccess.withValues(alpha: 0.2),
                    Colors.transparent,
                    AppColors.kError.withValues(alpha: 0.2),
                    AppColors.kSuccess.withValues(alpha: 0.2),
                  ],
                  stops: const [0.0, 0.5, 0.75, 1.0],
                ),
              ),
            ),
          ),
          Image.asset(
            Assets.logo,
            width: widget.size / 2,
            height: widget.size / 2,
          ),
        ],
      ),
    );
  }
}
