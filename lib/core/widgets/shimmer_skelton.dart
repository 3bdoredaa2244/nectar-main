import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Shimmer customSkelton(
    {required double width,
    required double height,
    double? opacity,
    double? borderRaduis}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey.withOpacity(0.5),
    highlightColor: Colors.white,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(opacity ?? .5),
        borderRadius: BorderRadius.circular(borderRaduis ?? 18),
      ),
      width: width,
      height: height,
    ),
  );
}
