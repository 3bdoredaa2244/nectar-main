import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../home/presentation/manager/count total order cubit/count_total_order_cubit.dart';
import '../../../manager/get carts cubit/get_carts_cubit.dart';
import 'custom_checkout_price.dart';

class CartActionButton extends StatelessWidget {
  const CartActionButton({
    super.key,
    required this.gotToCheckoutonTap,
  });
  final Function() gotToCheckoutonTap;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountTotalOrderCubit, CountTotalOrderState>(
      builder: (context, state) {
        return AnimatedOpacity(
          opacity: BlocProvider.of<CountTotalOrderCubit>(context)
                      .cartItems!
                      .isEmpty ||
                  BlocProvider.of<CountTotalOrderCubit>(context).cartItems ==
                      null
              ? .2
              : 1,
          duration: const Duration(milliseconds: 300),
          child: Stack(children: [
            CustomActionButton(
              buttonText: 'Go to Checkout',
              onTap: gotToCheckoutonTap,
            ),
            const Positioned(
              right: 22,
              top: 22,
              child: CustomCheckoutPriceText(),
            ),
          ]),
        );
      },
    );
  }
}
