import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nectar/core/utils/colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({super.key, required this.onChanged});
  final Function(String) onChanged;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'please enter your search words , must not be empty';
        }
        return null;
      },
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: (value) {},
      controller: searchController,
      decoration: InputDecoration(
          filled: true,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          fillColor: AppColors.honeydew,
          hintText: 'Search store',
          contentPadding: const EdgeInsets.all(15),
          prefixIconColor: AppColors.blackRussian,
          prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );
  }
}
