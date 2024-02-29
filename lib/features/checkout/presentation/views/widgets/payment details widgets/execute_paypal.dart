import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/core/models/cart_item_model.dart';
import 'package:nectar/core/utils/constants.dart';
import '../../../../../../core/payment/stripe_keys.dart';
import '../../../../data/models/amount_model/amount_model.dart';
import '../../../../data/models/amount_model/details.dart';
import '../../../../data/models/items_list_model/item.dart';
import '../../../../data/models/items_list_model/items_list_model.dart';
import '../../../manager/delete all carts cubit/delete_all_carts_cubit.dart';
import '../cart widgets/failure_state_dialog.dart';
import '../cart widgets/success_state_dialog.dart';

void executePaypal(
    {required BuildContext context,
    required num price,
    required List<CartItemModel> carts}) {
  var transactionData = getTransactionData(price: price, carts: carts);
  Navigator.of(context).push(MaterialPageRoute(
    builder: (BuildContext context) => PaypalCheckoutView(
      sandboxMode: true,
      clientId: PaymentKeys.clientId,
      secretKey: PaymentKeys.paypalSecretKey,
      transactions: [
        {
          "amount": transactionData.amount.toJson(),
          "description": "The payment transaction description.",
          "item_list": transactionData.itemList.toJson()
        }
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        log("onSuccess: $params");
        BlocProvider.of<DeleteAllCartsCubit>(context)
            .deleteAllCarts(userId: myuserId);
        GoRouter.of(context).pop();
        successStateDialog(dialogContext: context);
      },
      onError: (error) {
        log("onError: $error");
        failureStateDialog(context: context);
      },
      onCancel: () {
        log('cancelled:');
        GoRouter.of(context).pop();
      },
    ),
  ));
}

({AmountModel amount, ItemsListModel itemList}) getTransactionData(
    {required num price, required List<CartItemModel> carts}) {
  var amount = AmountModel(
      total: price.toString(),
      currency: "USD",
      details: Details(
          subtotal: price.toString(), shipping: "0", shippingDiscount: 0));
  List<OrderItemModel> listItems = carts
      .map((e) => OrderItemModel(
          currency: "USD",
          name: e.title,
          price: e.price.toString(),
          quantity: e.count as int))
      .toList();

  var itemList = ItemsListModel(orders: listItems);
  return (amount: amount, itemList: itemList);
}
