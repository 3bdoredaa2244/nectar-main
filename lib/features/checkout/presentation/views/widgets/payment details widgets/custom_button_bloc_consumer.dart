import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/core/utils/constants.dart';
import '../../../../../home/presentation/manager/count total order cubit/count_total_order_cubit.dart';
import '../../../manager/delete all carts cubit/delete_all_carts_cubit.dart';
import '../../../manager/get carts cubit/get_carts_cubit.dart';
import '../../../manager/payment cubit/payment_cubit.dart';
import '../cart widgets/failure_state_dialog.dart';
import '../cart widgets/success_state_dialog.dart';
import '../custom_button.dart';
import 'execute_paypal.dart';
import 'execute_stripe.dart';

class CustomButtonBlocConsumer extends StatefulWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  State<CustomButtonBlocConsumer> createState() =>
      _CustomButtonBlocConsumerState();
}

class _CustomButtonBlocConsumerState extends State<CustomButtonBlocConsumer> {
  @override
  void initState() {
    BlocProvider.of<GetCartsCubit>(context).getCarts(userId: myuserId);
    log(myuserId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteAllCartsCubit, DeleteAllCartsState>(
      listener: (context, state) {
        if (state is DeleteAllCartsFailure) {
          return log(state.errorMessage);
        }
      },
      child: BlocConsumer<PaymentCubit, PaymentState>(
        listener: (paymentcontext, state) async {
          if (state is PaymentSuccess) {
            await BlocProvider.of<DeleteAllCartsCubit>(context)
                .deleteAllCarts(userId: myuserId);
            GoRouter.of(context).pop();
            successStateDialog(dialogContext: context);
          } else if (state is PaymentFailure) {
            log(state.errorMessage);
            failureStateDialog(context: context);
          }
        },
        builder: (context, state) {
          return BlocBuilder<GetCartsCubit, GetCartsState>(
            builder: (context, totalState) {
              return BlocBuilder<GetCartsCubit, GetCartsState>(
                builder: (getCartscontext, state) {
                  return CustomButton(
                      isLoading: state is PaymentLoading ? true : false,
                      buttonText: 'Continue',
                      onPressed: () {
                        if (state is GetCartsSuccess) {
                          BlocProvider.of<CountTotalOrderCubit>(context)
                              .cartItems = state.carts;
                          BlocProvider.of<CountTotalOrderCubit>(context)
                              .generalTotalPrice = 0;
                          BlocProvider.of<CountTotalOrderCubit>(context)
                              .countTotal();
                          if (BlocProvider.of<PaymentCubit>(context)
                                  .activeIndex ==
                              0) {
                            executeStripe(
                                context: context,
                                price: BlocProvider.of<CountTotalOrderCubit>(
                                        context)
                                    .generalTotalPrice);
                          } else if (BlocProvider.of<PaymentCubit>(context)
                                  .activeIndex ==
                              1) {
                            executePaypal(
                                context: context,
                                price: BlocProvider.of<CountTotalOrderCubit>(
                                        context)
                                    .generalTotalPrice,
                                carts: state.carts);
                          }
                        }
                      });
                },
              );
            },
          );
        },
      ),
    );
  }
}
