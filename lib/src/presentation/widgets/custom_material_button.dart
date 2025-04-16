import 'package:flutter/material.dart';
import 'package:intuji_infogrid/src/core/core.dart';

class CustomMaterialButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double height;
  final double width;
  final double elevation;

  const CustomMaterialButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = Colors.yellow,
    this.textColor = AppColors.kBlack,
    this.height = 45.0,
    this.width = double.infinity,
    this.elevation = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      textColor: textColor,
      height: height,
      minWidth: width,
      elevation: elevation,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: Text(text, style: AppStyles.text16PxSemiBold),
    );
  }
}
