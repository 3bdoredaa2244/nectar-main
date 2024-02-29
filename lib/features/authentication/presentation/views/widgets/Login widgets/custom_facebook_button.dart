import 'package:flutter/material.dart';
import 'package:nectar/core/utils/styles.dart';
import '../../../../../../core/utils/colors.dart';

class CustomFacebookButton extends StatelessWidget {
  const CustomFacebookButton({
    super.key,
    this.image = 'assets/images/facebook.png',
    this.socialmediaName = 'Facebook',
  });
  final String image;
  final String socialmediaName;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width / 2 - 40,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.grey)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
            child: Image.asset(
              image,
              width: 30,
              height: 30,
              color: AppColors.facebookColor,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            socialmediaName,
            style: Styles.styleBlackRussian18,
          ),
        ],
      ),
    );
  }
}
