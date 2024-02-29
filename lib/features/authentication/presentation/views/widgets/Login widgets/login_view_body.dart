import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/core/utils/app_routes.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../another_option_authentication_text.dart';
import '../custom_seperator_row.dart';
import '../custom_socialmedia_row.dart';
import 'custom_login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 45),
                child: Center(
                  child: Text(
                    'Login Now',
                    style: Styles.styleBlackRussian28
                        .copyWith(color: AppColors.oceanGreen),
                  ),
                ),
              ),
              const CustomLoginForm(),
              const CustomAdditionalContent(),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Center(child: AnotherOptionText(
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.registerView);
                  },
                )),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CustomAdditionalContent extends StatelessWidget {
  const CustomAdditionalContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20,
          ),
          CustomSeperatorRow(),
          SizedBox(
            height: 30,
          ),
          CustomSocialMediaRow(),
        ],
      ),
    );
  }
}
