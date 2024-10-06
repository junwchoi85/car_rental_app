import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.color = Colors.black,
    this.height = 1.0,
    this.horizontalPadding = 8.0,
  });

  final Color color;
  final double height;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Divider(
        color: color,
        height: height,
      ),
    );
  }
}
