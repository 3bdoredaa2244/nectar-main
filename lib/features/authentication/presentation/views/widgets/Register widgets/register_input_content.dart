import 'package:flutter/material.dart';

import '../../../../../../core/widgets/custom_authentication_textformfield.dart';

class RegisterInputContent extends StatefulWidget {
  const RegisterInputContent(
      {super.key,
      required this.autovalidateMode,
      required this.usernameController,
      required this.emailController,
      required this.passwordController});
  final AutovalidateMode autovalidateMode;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  @override
  State<RegisterInputContent> createState() => _RegisterInputContentState();
}

class _RegisterInputContentState extends State<RegisterInputContent> {
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAuthenticationTextformfield(
          autovalidateMode: widget.autovalidateMode,
          controller: widget.usernameController,
          type: TextInputType.name,
          label: 'Username',
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
            if (value?.isEmpty ?? true) {
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
