import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/features/authentication/presentation/manager/validate%20login/validate_login_cubit.dart';

import '../../../../../../core/widgets/custom_authentication_textformfield.dart';

class InputLoginDetails extends StatefulWidget {
  const InputLoginDetails({
    super.key,
    required this.autovalidateMode,
    required this.emailController,
    required this.passwordController,
  });
  final AutovalidateMode autovalidateMode;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  @override
  State<InputLoginDetails> createState() => _InputLoginDetailsState();
}

class _InputLoginDetailsState extends State<InputLoginDetails> {
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomAuthenticationTextformfield(
          autovalidateMode: widget.autovalidateMode,
          controller: widget.emailController,
          type: TextInputType.emailAddress,
          label: 'Email address',
          validate: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please enter your email';
            } else {
              return null;
            }
          },
        ),
        const SizedBox(
          height: 20,
        ),
        CustomAuthenticationTextformfield(
          autovalidateMode: widget.autovalidateMode,
          controller: widget.passwordController,
          type: TextInputType.visiblePassword,
          label: 'Password',
          isPassword: isPassword,
          validate: (value) {
            if (value?.isEmpty ??
                true && BlocProvider.of<ValidateLoginCubit>(context).isLogin) {
              return 'Please enter the password';
            } else {
              return null;
            }
          },
          suffixPressed: () {
            setState(() {
              isPassword = !isPassword;
            });
          },
          suffix: isPassword
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
