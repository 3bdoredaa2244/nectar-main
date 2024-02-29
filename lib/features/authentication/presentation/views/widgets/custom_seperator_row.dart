import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'Login widgets/custom_seperator_authentication.dart';

class CustomSeperatorRow extends StatelessWidget {
  const CustomSeperatorRow({super.key, this.typeSeperatorText = 'Login'});
  final String typeSeperatorText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomSeperatorAuthentication(),
        const SizedBox(
          width: 2,
        ),
        Text(
          'OR $typeSeperatorText using',
          style: Styles.styleGrey14,
        ),
        const SizedBox(
          width: 2,
        ),
        const CustomSeperatorAuthentication(),
      ],
    );
  }
}
