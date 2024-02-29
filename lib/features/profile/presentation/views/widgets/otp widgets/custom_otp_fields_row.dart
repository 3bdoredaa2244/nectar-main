import 'package:flutter/widgets.dart';

import 'otp_item.dart';

class CustomOtpFieldsRow extends StatefulWidget {
  const CustomOtpFieldsRow({super.key});

  @override
  State<CustomOtpFieldsRow> createState() => _CustomOtpFieldsRowState();
}

class _CustomOtpFieldsRowState extends State<CustomOtpFieldsRow> {
  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();
  TextEditingController otp5Controller = TextEditingController();
  TextEditingController otp6Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OtpItem(
          otpController: otp1Controller,
          isFirst: true,
          isLast: false,
        ),
        OtpItem(
          otpController: otp2Controller,
          isFirst: false,
          isLast: false,
        ),
        OtpItem(
          otpController: otp3Controller,
          isFirst: false,
          isLast: false,
        ),
        OtpItem(
          otpController: otp4Controller,
          isFirst: false,
          isLast: false,
        ),
        OtpItem(
          otpController: otp5Controller,
          isFirst: false,
          isLast: false,
        ),
        OtpItem(
          otpController: otp6Controller,
          isFirst: false,
          isLast: true,
        ),
      ],
    );
  }
}
