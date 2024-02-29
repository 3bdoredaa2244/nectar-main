import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/payment_methods_model.dart';
import '../../../manager/payment cubit/payment_cubit.dart';
import 'payment_methods_listview_item.dart';

class CustomPaymentMethodsListview extends StatefulWidget {
  const CustomPaymentMethodsListview({
    super.key,
  });
  @override
  State<CustomPaymentMethodsListview> createState() =>
      _CustomPaymentMethodsListviewState();
}

class _CustomPaymentMethodsListviewState
    extends State<CustomPaymentMethodsListview> {
  List<PaymentMethodsModel> paymentMethods = [
    PaymentMethodsModel(image: 'assets/images/SVGRepo_iconCarrier.svg'),
    PaymentMethodsModel(image: 'assets/images/Group.svg')
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (BuildContext context, state) {
        return SizedBox(
          height: 62,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    BlocProvider.of<PaymentCubit>(context).changeIndex(index);
                  },
                  child: PaymentMethodsListviewItem(
                      isActive: BlocProvider.of<PaymentCubit>(context)
                          .checkIndex(index),
                      image: paymentMethods[index].image),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    width: 20,
                  ),
              itemCount: paymentMethods.length),
        );
      },
    );
  }
}
