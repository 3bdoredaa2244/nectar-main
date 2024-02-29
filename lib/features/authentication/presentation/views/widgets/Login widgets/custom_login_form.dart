import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../../../../core/utils/app_routes.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../manager/login cubit/login_cubit.dart';
import '../../../manager/reset password cubit/reset_password_cubit.dart';
import '../../../manager/validate login/validate_login_cubit.dart';
import 'custom_checkbox_row.dart';
import 'input_login_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomLoginForm extends StatefulWidget {
  const CustomLoginForm({
    super.key,
  });
  @override
  State<CustomLoginForm> createState() => _CustomLoginFormState();
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool isPassword = true;
  bool isLogin = true;
  Timer? _timer;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: InputLoginDetails(
              autovalidateMode: autovalidateMode,
              emailController: emailController,
              passwordController: passwordController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 25, 40),
            child: CustomCheckBoxRow(
              emailController: emailController,
              onTap: () {
                BlocProvider.of<ValidateLoginCubit>(context).changeToReset();
                if (formkey.currentState!.validate()) {
                  BlocProvider.of<ResetPasswordCubit>(context).email =
                      emailController.text;
                  BlocProvider.of<ResetPasswordCubit>(context).resetPassword();
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
          ),
          BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) async {
              if (state is LoginFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorMessage)));
                _timer?.cancel();
                await EasyLoading.dismiss();
              } else if (state is LoginSuccess) {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.setString("id", state.user.uid);
                _timer?.cancel();
                await EasyLoading.showSuccess('Great Success!');
                AppRoutes.router
                    .pushReplacement(AppRoutes.homeView, extra: state.user.uid);
              } else {
                _timer?.cancel();
                await EasyLoading.show(
                  status: 'loading...',
                  maskType: EasyLoadingMaskType.black,
                );
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Center(
                  child: CustomActionButton(
                    buttonText: 'Login',
                    onTap: () {
                      BlocProvider.of<ValidateLoginCubit>(context)
                          .changeToLogin();
                      if (formkey.currentState!.validate()) {
                        BlocProvider.of<LoginCubit>(context)
                            .validateLogin(emailController, passwordController);
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
