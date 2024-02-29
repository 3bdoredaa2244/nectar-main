import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../another_option_authentication_text.dart';
import 'custom_register_form.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverGap(30),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 45),
                child: Center(
                  child: Text(
                    'Register Now',
                    style: Styles.styleBlackRussian28
                        .copyWith(color: AppColors.oceanGreen),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: CustomRegisterForm(),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Center(
                    child: AnotherOptionText(
                  optionMessage: 'Have an account ?',
                  signType: 'Login',
                )),
              )
            ],
          ),
        ),
      ],
    );
  }
}
