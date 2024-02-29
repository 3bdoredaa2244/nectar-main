import 'package:flutter/material.dart';
import 'package:nectar/core/utils/app_routes.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/widgets/custom_button.dart';
import '../../../../../core/utils/assets.dart';
import 'onboarding_welcome_text.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 100, 25, 25),
      child: Column(
        children: [
          const OnboardingWelcomeText(),
          const SizedBox(
            height: 70,
          ),
          Image.asset(mainLogo),
          const Spacer(),
          const CustomActionButton(buttonText: 'Get Started'),
          const SizedBox(
            height: 25,
          ),
          CustomActionButton(
            onTap: () {
              AppRoutes.router.push(AppRoutes.loginView);
            },
            buttonText: 'Login',
            backgroundColor: Colors.transparent,
            fontColor: AppColors.oceanGreen,
            borderColor: AppColors.oceanGreen,
          )
        ],
      ),
    );
  }
}
