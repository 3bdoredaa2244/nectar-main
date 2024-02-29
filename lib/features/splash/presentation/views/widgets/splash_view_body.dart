import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/core/utils/app_routes.dart';
import '../../../../../core/utils/colors.dart';
import 'splash_view_banner.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> logoAnimation;
  late Animation<Offset> titleAnimation;
  late Animation<Offset> subtitleAnimation;
  @override
  void initState() {
    initLogoAnimation();
    initTitleAnimation();
    initSubTitleAnimation();
    initNavigationHome();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.oceanGreen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
          ),
          SplashViewBanner(
            logoAnimation: logoAnimation,
            subtitleAnimation: subtitleAnimation,
            titleAnimation: titleAnimation,
          )
        ],
      ),
    );
  }

  void initLogoAnimation() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2500));
    logoAnimation = Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.linear));
    animationController.forward();
  }

  void initTitleAnimation() {
    titleAnimation = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.linear));
  }

  void initSubTitleAnimation() {
    subtitleAnimation =
        Tween<Offset>(begin: const Offset(0, 30), end: Offset.zero).animate(
            CurvedAnimation(parent: animationController, curve: Curves.linear));
  }

  void initNavigationHome() {
    Future.delayed(const Duration(seconds: 5), () {
      //GoRouter.of(context).push(AppRoutes.homeView);
      GoRouter.of(context).pushReplacement(AppRoutes.onboardingView);
      /*Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const TestView()));*/
    });
  }
}
