import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.isLoading = false,
  });
  final String buttonText;
  final void Function()? onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: const Color(0xff34A853),
      onPressed: onPressed,
      height: 73,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      child: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                buttonText,
                style: Styles.styleTimberGreen20,
              ),
      ),
    );
  }
}
