import 'package:flutter/material.dart';
import 'package:nectar/features/profile/presentation/views/widgets/otp%20widgets/otp_view_appbar.dart';

import 'widgets/otp widgets/otp_view_body.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: otPViewAppBar(),
      body: const OtpViewBody(),
    );
  }
}
