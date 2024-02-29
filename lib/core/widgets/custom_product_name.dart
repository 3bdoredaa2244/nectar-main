import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/styles.dart';

class CustomProductName extends StatelessWidget {
  const CustomProductName({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 1,
      style: Styles.styleBlackRussian18
          .copyWith(letterSpacing: .1.sp, fontWeight: FontWeight.w700),
    );
  }
}
