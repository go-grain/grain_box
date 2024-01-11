import 'package:flutter/material.dart';

class GDefaultCard extends StatelessWidget {
  const GDefaultCard({
    required this.child,
    this.alignment,
    this.onTap,
    this.borderRadius = 15,
    this.highlightColor = Colors.white,
    this.cardColor = Colors.white,
    this.bg = Colors.white,
    this.shadowColor = Colors.amber,
    this.radius = 200,
    this.elevation = 1,
    this.height,
    this.width,
    Key? key,
  }) : super(key: key);

  final Color highlightColor;
  final Color cardColor;
  final Color bg;
  final Color shadowColor;
  final double borderRadius;
  final double elevation;
  final double radius;
  final double? height;
  final double? width;
  final Widget child;
  final Function? onTap;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      elevation: elevation,
      shadowColor: shadowColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        alignment: alignment,
        height: height,
        width: width,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          highlightColor: highlightColor,
          radius: radius,
          onTap: onTap != null ? () => onTap!() : null,
          child: child,
        ),
      ),
    );
  }
}
