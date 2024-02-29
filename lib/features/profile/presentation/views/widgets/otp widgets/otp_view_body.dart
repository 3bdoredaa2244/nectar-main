import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/core/function/custom_toast_text.dart';
import 'package:nectar/core/models/toast_states.dart';
import 'package:nectar/core/utils/styles.dart';
import '../../../manager/phone auth cubit/phone_auth_cubit.dart';
import 'custom_check_recieve_code.dart';
import 'custom_otp_fields_row.dart';

class OtpViewBody extends StatefulWidget {
  const OtpViewBody({super.key});

  @override
  State<OtpViewBody> createState() => _OtpViewBodyState();
}

class _OtpViewBodyState extends State<OtpViewBody> {
  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();
  TextEditingController otp5Controller = TextEditingController();
  TextEditingController otp6Controller = TextEditingController();
  @override
  void initState() {
    BlocProvider.of<PhoneAuthCubit>(context).phoneAuth(
        sms: otp1Controller.text +
            otp2Controller.text +
            otp3Controller.text +
            otp4Controller.text +
            otp5Controller.text +
            otp6Controller.text);
    startTimer();
    super.initState();
  }

  int counter = 60;
  late Timer _timer;
  @override
  void dispose() {
    otp1Controller.dispose();
    otp2Controller.dispose();
    otp3Controller.dispose();
    otp4Controller.dispose();
    otp5Controller.dispose();
    otp6Controller.dispose();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (counter > 0) {
          counter--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listener: (context, state) {
        if (state is PhoneAuthSuccess) {
          //GoRouter.of(context).pop();
          customToastText(
            toastMessage: 'success phone auth ',
            state: ToastStates.success,
          );
          log('success phone auth ');
        } else if (state is PhoneAuthFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const CustomOtpFieldsRow(),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomCheckRecieveCode(),
                  Text(
                    '$counter',
                    style: Styles.styleBlackRussian28
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              /*CustomActionButton(
                  buttonText: 'Confirm',
                  onTap: () async {
                    await BlocProvider.of<PhoneAuthCubit>(context).phoneAuth(
                        sms: otp1Controller.text +
                            otp2Controller.text +
                            otp3Controller.text +
                            otp4Controller.text +
                            otp5Controller.text +
                            otp6Controller.text);
                  },
                )*/
            ],
          ),
        ),
      ),
    );
  }
}
