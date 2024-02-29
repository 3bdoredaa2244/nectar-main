import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets.dart';
import 'user_location_details.dart';

class ShopViewAppBar extends StatelessWidget {
  const ShopViewAppBar({super.key, required this.location});
  final String location;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Image(image: AssetImage(shopLogo)),
        UserLocationDetails(
          location: location,
        )
      ],
    );
  }
}
