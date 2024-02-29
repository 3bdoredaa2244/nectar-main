import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/home/presentation/manager/toggle images cubit/toggle_images_cubit.dart';
import '../utils/colors.dart';

class CustomDotIndicator extends StatelessWidget {
  const CustomDotIndicator({super.key, required this.items});
  final List<String> items;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleImagesCubit, ToggleImagesState>(
      builder: (context, state) {
        var toggleCubit = ToggleImagesCubit.get(context);
        return DotsIndicator(
            dotsCount: items.length,
            position: toggleCubit.currentIndex,
            decorator: DotsDecorator(
              size: const Size.square(6.0),
              activeSize: const Size(16.0, 6.0),
              activeColor: AppColors.oceanGreen,
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0)),
            ));
      },
    );
  }
}
