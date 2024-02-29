import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../home/presentation/manager/count total order cubit/count_total_order_cubit.dart';

class CustomCheckoutPriceText extends StatelessWidget {
  const CustomCheckoutPriceText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      width: 43,
      decoration: BoxDecoration(
          color: AppColors.deepGreen, borderRadius: BorderRadius.circular(4)),
      child: BlocBuilder<CountTotalOrderCubit, CountTotalOrderState>(
        builder: (context, state) {
          return Center(
            child: Text(
              '\$ '
              '${BlocProvider.of<CountTotalOrderCubit>(context).generalTotalPrice}',
              style: Styles.styleblackRussian12.copyWith(color: AppColors.snow),
            ),
          );
        },
      ),
    );
  }
}
