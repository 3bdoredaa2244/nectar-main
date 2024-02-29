import 'package:flutter/material.dart';
import 'custom_main_subtitle.dart';

class CheckEmailBody extends StatelessWidget {
  const CheckEmailBody({super.key, required this.bodyText});
  final String bodyText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
          const CustomMainSubtitle(),
          const SizedBox(
            height: 25,
          ),
          Text(
              "We've sent you an email. Click the link in the email to $bodyText"),
          const SizedBox(
            height: 25,
          ),
          const Text(
              "If you don't see the email, check other places it might be ,like your junk, spam, social ,other folders"),
        ],
      ),
    );
  }
}
