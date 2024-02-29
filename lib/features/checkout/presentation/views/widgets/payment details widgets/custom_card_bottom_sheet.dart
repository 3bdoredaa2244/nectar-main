import 'package:flutter/material.dart';
import 'payment_methods_listview.dart';
import 'custom_button_bloc_consumer.dart';

class CustomCardBottomSheet extends StatelessWidget {
  const CustomCardBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomPaymentMethodsListview(),
          SizedBox(
            height: 32,
          ),
          CustomButtonBlocConsumer()
        ],
      ),
    );
  }
}
