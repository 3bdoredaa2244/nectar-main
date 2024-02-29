import 'package:flutter/material.dart';

class AccountModel {
  late String title;
  late IconData leadingIcon;
  Widget? trailing;
  late Function onTap;
  AccountModel(
      {required this.title,
      required this.leadingIcon,
      required this.onTap,
      this.trailing});
}
