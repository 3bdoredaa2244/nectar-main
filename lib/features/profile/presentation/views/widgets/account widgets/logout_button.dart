import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/features/authentication/presentation/manager/sign%20out%20cubit/sign_out_cubit.dart';

import '../../../../../../core/utils/app_routes.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/widgets/custom_button.dart';

class LogoutAccountButton extends StatelessWidget {
  const LogoutAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomActionButton(
          buttonText: 'Log Out',
          backgroundColor: AppColors.honeydew,
          fontColor: AppColors.oceanGreen,
          onTap: () async {
            await BlocProvider.of<SignOutCubit>(context).signOut();
            AppRoutes.router.pushReplacement(AppRoutes.loginView);
          },
        ),
        const PositionedDirectional(
          start: 25,
          top: 25,
          child: Icon(
            Icons.logout_outlined,
            size: 20,
            color: AppColors.oceanGreen,
          ),
        )
      ],
    );
  }
}
