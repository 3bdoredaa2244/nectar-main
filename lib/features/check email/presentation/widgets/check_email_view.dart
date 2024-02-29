import 'package:flutter/material.dart';
import '../../../authentication/data/models/check_email_model.dart';
import 'check email/check_email.appbar.dart';
import 'check email/check_email_body.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key, required this.checkEmailModel});
  final CheckEmailModel checkEmailModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: checkEmailAppbar(checkEmailModel.title),
      body: CheckEmailBody(
        bodyText: checkEmailModel.bodyText,
      ),
    );
  }
}
