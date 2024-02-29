import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nectar/core/utils/app_routes.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

PreferredSizeWidget? checkEmailAppbar(String title) {
  return AppBar(
    title: Text(
      title,
      style: Styles.styleTimberGreen20.copyWith(color: AppColors.blackRussian),
    ),
    centerTitle: true,
    leading: const SizedBox(
      height: 1,
    ),
    actions: [
      IconButton(
        onPressed: () {
          AppRoutes.router.replace(AppRoutes.loginView);
        },
        icon: const Icon(FontAwesomeIcons.xmark),
        color: AppColors.blackRussian,
        iconSize: 24,
      ),
      const SizedBox(
        width: 5,
      )
    ],
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
