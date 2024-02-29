import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:share_plus/share_plus.dart';

import 'custom_appbar_icon.dart';

class ProductDetailsAppbar extends StatelessWidget {
  const ProductDetailsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
          width: double.infinity,
          height: 60,
          color: AppColors.honeydew,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomIcon(
                icon: const Icon(
                  FontAwesomeIcons.angleLeft,
                  color: AppColors.blackRussian,
                ),
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              ),
              CustomIcon(
                icon: const Icon(
                  FontAwesomeIcons.arrowUpFromBracket,
                  color: AppColors.blackRussian,
                ),
                onPressed: () {
                  Share.share('check out my website https://example.com',
                      subject: 'Look what I made!');
                },
              ),
            ],
          )),
    );
  }
}
