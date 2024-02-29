import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';

class CustomAuthenticationTextformfield extends StatelessWidget {
  const CustomAuthenticationTextformfield(
      {super.key,
      required this.controller,
      required this.type,
      this.validate,
      this.onSubmit,
      this.onChanged,
      required this.label,
      this.prefix,
      this.suffix,
      this.onTap,
      this.isPassword = false,
      this.suffixPressed,
      this.radius = 12.0,
      this.width = double.infinity,
      this.autovalidateMode});
  final TextEditingController controller;
  final TextInputType type;
  final FormFieldValidator<String>? validate;
  final ValueChanged<String>? onSubmit;
  final Function(String)? onChanged;
  final String label;
  final IconData? prefix;
  final IconData? suffix;
  final GestureTapCallback? onTap;
  final bool isPassword;
  final VoidCallback? suffixPressed;
  final double radius;
  final double width;
  final AutovalidateMode? autovalidateMode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      cursorColor: AppColors.oceanGreen,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      //textDirection: TextDirection.rtl,
      textAlign: TextAlign.start,
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: (s) {
        debugPrint(s);
      },
      onTap: onTap,
      onChanged: onChanged,
      validator: validate,
      obscureText: isPassword,
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: const BorderSide(color: AppColors.oceanGreen),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: const BorderSide(color: AppColors.oceanGreen),
        ),
        /*enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: const BorderSide(color: AppColors.oceanGreen),
        ),*/
        labelText: label,
        labelStyle: Styles.styleGrey14,
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
