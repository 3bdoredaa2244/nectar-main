import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nectar/core/utils/app_routes.dart';
import 'package:nectar/features/authentication/data/models/check_email_model.dart';
import 'package:nectar/features/authentication/presentation/manager/register%20cubit/register_cubit.dart';
import 'package:nectar/features/profile/data/models/user%20details%20model/user_details.dart';
import 'package:nectar/features/profile/presentation/manager/add%20user%20details/add_user_details_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../checkout/presentation/manager/get customer id cubit/get_customer_id_cubit.dart';
import 'register_input_content.dart';

class CustomRegisterForm extends StatefulWidget {
  const CustomRegisterForm({super.key});

  @override
  State<CustomRegisterForm> createState() => _CustomRegisterFormState();
}

class _CustomRegisterFormState extends State<CustomRegisterForm> {
  var formkey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  Timer? _timer;
  bool isPassword = true;
  @override
  void initState() {
    BlocProvider.of<GetCustomerIdCubit>(context).getCustomerId();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
    EasyLoading.addStatusCallback((status) {
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCustomerIdCubit, GetCustomerIdState>(
      builder: (context, customerstate) {
        return BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) async {
            if (state is RegisterFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
              _timer?.cancel();
              await EasyLoading.dismiss();
            } else if (state is RegisterSuccess &&
                customerstate is GetCustomerIdSuccess) {
              _timer?.cancel();
              await BlocProvider.of<AddUserDetailsCubit>(context).addUser(
                  UserDetailsModel(
                      id: state.user.uid,
                      name: state.user.displayName,
                      email: state.user.email!,
                      customerId: customerstate.customer.id,
                      photo: state.user.photoURL ??
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQp8HE9nJ03LBSlHivqF46xHQ640tNgo-9nnFrUMANrL3tf4lOHdDeNzjLZurWNUf3oIt8&usqp=CAU'));
              SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              sharedPreferences.setString("id", state.user.uid);
              await EasyLoading.showSuccess('Great Success!');
              AppRoutes.router.pushReplacement(AppRoutes.checkEmail,
                  extra: CheckEmailModel(
                      title: 'Register', bodyText: 'activate your account'));
            } else {
              _timer?.cancel();
              await EasyLoading.show(
                status: 'loading...',
                maskType: EasyLoadingMaskType.black,
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RegisterInputContent(
                    autovalidateMode: autovalidateMode,
                    usernameController: usernameController,
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  Center(
                    child: CustomActionButton(
                      buttonText: 'Sign up',
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          BlocProvider.of<RegisterCubit>(context)
                              .validateRegister(
                                  emailController, passwordController);
                        } else {
                          setState(() {
                            autovalidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
