import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/core/utils/constants.dart';
import '../../../../data/models/payment_intent_input_model.dart';
import '../../../manager/payment cubit/payment_cubit.dart';

void executeStripe({
  required BuildContext context,
  required num price,
}) {
  PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
      amount: (price * 100).toString(),
      currency: 'USD',
      customerId: myCustomerId);
  BlocProvider.of<PaymentCubit>(context)
      .makePayment(paymentIntentInputModel: paymentIntentInputModel);
}
