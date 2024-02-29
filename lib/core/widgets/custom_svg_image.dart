import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgImage extends StatelessWidget {
  const CustomSvgImage(
      {super.key,
      required this.image,
      required this.width,
      required this.height,
      this.allowOutsideBox = false});
  final String image;
  final double width;
  final double height;
  final bool allowOutsideBox;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      width: width,
      height: height,
      allowDrawingOutsideViewBox: allowOutsideBox,
    );
  }
}
