import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/home/presentation/manager/toggle images cubit/toggle_images_cubit.dart';

// ignore: must_be_immutable
class CustomImageSlider extends StatefulWidget {
  const CustomImageSlider(
      {super.key,
      required this.items,
      required this.aspectRactio,
      required this.height,
      required this.autoNavigate,
      required this.fitImage});
  final List<String> items;
  final double aspectRactio;
  final double height;
  final bool autoNavigate;
  final BoxFit fitImage;
  @override
  State<CustomImageSlider> createState() => _CustomImageSliderState();
}

class _CustomImageSliderState extends State<CustomImageSlider> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: CarouselSlider(
          items: widget.items
              .map((e) => ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image(
                      image: AssetImage(e),
                      fit: widget.fitImage,
                      width: double.infinity,
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
              height: widget.height,
              aspectRatio: widget.aspectRactio,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: widget.autoNavigate,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              onPageChanged: (value, reason) {
                ToggleImagesCubit.get(context).changeCurrentIndexValue(value);
              },
              scrollDirection: Axis.horizontal,
              scrollPhysics: const BouncingScrollPhysics())),
    );
  }
}
