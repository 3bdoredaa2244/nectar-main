import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/shimmer_skelton.dart';

CachedNetworkImage cachedMyNetworkImage(
    {required String imageUrl,
    required double height,
    required double width,
    BoxFit? fit = BoxFit.fill}) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    height: height,
    width: width,
    fit: fit,
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17.r),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    ),
    placeholder: (context, url) =>
        customSkelton(width: MediaQuery.sizeOf(context).width, height: 100),
    errorWidget: (context, url, error) =>
        const Center(child: Icon(Icons.error)),
  );
}
