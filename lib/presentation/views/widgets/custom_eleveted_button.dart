import 'package:flutter/material.dart';

class CustomElevetedButton extends StatelessWidget {
  const CustomElevetedButton({
    super.key,
    this.width = double.infinity,
    this.color,
    this.onPressed,
    required this.content,
  });

  final double width;
  final Color? color;
  final Function()? onPressed;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        child: content,
      ),
    );
  }
}
