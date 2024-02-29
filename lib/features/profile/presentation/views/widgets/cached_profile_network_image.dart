import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/shimmer_skelton.dart';

CachedNetworkImage cachedProfilNetworkImage({required String imageUrl}) {
  return CachedNetworkImage(
    height: 164,
    width: 164,
    imageUrl: imageUrl,
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26.r),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.fill,
        ),
      ),
    ),
    placeholder: (context, url) =>
        customSkelton(width: 64, height: 64, borderRaduis: 26.r),
    errorWidget: (context, url, error) =>
        const Center(child: Icon(Icons.error)),
  );
}
