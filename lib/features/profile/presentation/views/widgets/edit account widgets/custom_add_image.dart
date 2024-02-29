import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';
import '../cached_profile_network_image.dart';

class CustomAddImage extends StatelessWidget {
  const CustomAddImage({super.key, required this.imageUrl, this.onPressed});
  final String imageUrl;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.antiAlias,
      children: [
        cachedProfilNetworkImage(
          imageUrl: imageUrl,
        ),
        Positioned.directional(
          textDirection: TextDirection.ltr,
          end: -10,
          bottom: -10,
          child: IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.add_a_photo,
                size: 30,
                color: AppColors.oceanGreen,
              )),
        )
      ],
    );
  }
}
