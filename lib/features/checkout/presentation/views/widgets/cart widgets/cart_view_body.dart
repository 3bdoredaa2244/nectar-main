import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';
import '../../../../../../core/models/cart_item_model.dart';
import '../../../../data/repos/cart repo/cart_repo_imp.dart';
import '../../../../data/repos/checkout_repo_imp.dart';
import '../../../manager/delete all carts cubit/delete_all_carts_cubit.dart';
import '../../../manager/payment cubit/payment_cubit.dart';
import '../payment details widgets/custom_card_bottom_sheet.dart';
import 'cart_action_button.dart';
import 'custom_cart_listview.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key, required this.cartItems});
  final List<CartItemModel> cartItems;
  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 30),
          child: Text(
            'My Cart',
            style: Styles.styleTimberGreen20
                .copyWith(color: AppColors.blackRussian),
          ),
        ),
        const Divider(
          height: 1,
          color: AppColors.grey,
        ),
        const Expanded(
          child: CartListView(),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25, left: 25, bottom: 25),
          child: CartActionButton(gotToCheckoutonTap: () {
            showModalSheet(modalContext: context);
          }),
        )
      ],
    );
  }

  showModalSheet({required BuildContext modalContext}) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        context: modalContext,
        builder: (dialogContext) {
          return MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => PaymentCubit(CheckoutRepoImp()),
            ),
            BlocProvider(
              create: (context) => DeleteAllCartsCubit(CartRepoImp()),
            ),
          ], child: const CustomCardBottomSheet());
        });
  }
}
