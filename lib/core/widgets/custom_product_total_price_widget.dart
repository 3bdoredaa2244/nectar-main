import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/home/presentation/manager/control count cubit/control_count_cubit.dart';
import '../models/product_item_model.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';

class ProductTotalPrice extends StatelessWidget {
  const ProductTotalPrice({super.key, required this.product});
  final ProductItemModel product;
  @override
  Widget build(BuildContext context) {
    var get = ControlCountCubit.get(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Total : ',
          style: Styles.styleBlackRussian18
              .copyWith(color: AppColors.grey, fontWeight: FontWeight.w400),
        ),
        BlocBuilder<ControlCountCubit, ControlCountState>(
          builder: (context, state) {
            return Text(
              '\$ '
              '${get.total}',
              style: Styles.styleBlackRussian18
                  .copyWith(fontWeight: FontWeight.w400),
            );
          },
        ),
      ],
    );
  }
}
