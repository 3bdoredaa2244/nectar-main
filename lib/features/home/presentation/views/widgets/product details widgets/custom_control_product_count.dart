import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/models/product_item_model.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../manager/control count cubit/control_count_cubit.dart';
import 'custom_appbar_icon.dart';
import 'custom_product_price_widget.dart';
import '../../../../../../core/widgets/custom_product_total_price_widget.dart';

class CustomControlProductCount extends StatefulWidget {
  const CustomControlProductCount({
    super.key,
    required this.product,
  });
  final ProductItemModel product;

  @override
  State<CustomControlProductCount> createState() =>
      _CustomControlProductCountState();
}

class _CustomControlProductCountState extends State<CustomControlProductCount> {
  @override
  Widget build(BuildContext context) {
    var get = ControlCountCubit.get(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 47.w,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightGray),
              borderRadius: BorderRadius.circular(17.r)),
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: CustomIcon(
                icon: const Icon(Icons.remove),
                size: 23,
                onPressed: () {
                  get.decrementCount(
                      offerPrice: widget.product.offerPrice,
                      price: widget.product.price);
                }),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        BlocBuilder<ControlCountCubit, ControlCountState>(
          builder: (context, state) {
            return Center(
              child: Text(
                get.count.toString(),
                style: Styles.styleBlackRussian18,
              ),
            );
          },
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 46.w,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightGray),
              borderRadius: BorderRadius.circular(17.r)),
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: CustomIcon(
                icon: const Icon(
                  Icons.add,
                  color: AppColors.oceanGreen,
                  size: 23,
                ),
                onPressed: () {
                  get.incrementCount(
                      offerPrice: widget.product.offerPrice,
                      price: widget.product.price);
                }),
          ),
        ),
        const Spacer(),
        CustomCartPrice(product: widget.product)
      ],
    );
  }
}

class CustomCartPrice extends StatelessWidget {
  const CustomCartPrice({
    super.key,
    required this.product,
  });

  final ProductItemModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomProductPrice(
          product: product,
        ),
        ProductTotalPrice(
          product: product,
        ),
      ],
    );
  }
}
