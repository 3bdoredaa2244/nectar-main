import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors.dart';

class CustomSeperatorAuthentication extends StatelessWidget {
  const CustomSeperatorAuthentication({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.20000000298023224,
      child: Container(
          width: 70,
          height: 2,
          decoration: const BoxDecoration(color: AppColors.blackRussian)),
    );
  }
}
