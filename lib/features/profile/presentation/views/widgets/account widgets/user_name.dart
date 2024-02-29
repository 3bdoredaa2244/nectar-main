import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/core/utils/app_routes.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../data/models/user details model/user_details.dart';

class CustomUserName extends StatelessWidget {
  const CustomUserName({
    super.key,
    required this.user,
  });
  final UserDetailsModel user;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * .5,
          child: Text(
            user.name ?? 'undefined',
            style: Styles.styleTimberGreen20
                .copyWith(color: AppColors.blackRussian),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.editAccountView);
          },
          icon: const Icon(
            Icons.mode_edit_outlined,
            size: 15,
            color: AppColors.oceanGreen,
          ),
        )
      ],
    );
  }
}
