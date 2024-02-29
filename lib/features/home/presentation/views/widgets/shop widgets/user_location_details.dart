import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';

class UserLocationDetails extends StatelessWidget {
  const UserLocationDetails({super.key, required this.location});
  final String location;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.location_on),
        Text(
          location,
          style: Styles.styleBlackRussian18.copyWith(color: AppColors.feldgrau),
        )
      ],
    );
  }
}
