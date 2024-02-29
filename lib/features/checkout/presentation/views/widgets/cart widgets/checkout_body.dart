import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../home/data/models/expansion_tile_model.dart';
import 'checkout_appbar.dart';
import 'checkout_listview.dart';
import 'custom_terms_text.dart';

class CheckoutBody extends StatelessWidget {
  const CheckoutBody({
    super.key,
    required this.expansionItems,
    required this.placeOrderOnTap,
  });

  final List<ExpansionTileModel> expansionItems;
  final Function() placeOrderOnTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CheckOutAppBar(),
        const Divider(
          height: 1,
          color: AppColors.lightGray,
        ),
        Expanded(
          child: CheckoutListView(
            expansionItems: expansionItems,
          ),
        ),
        const CustomTermsText(),
        Padding(
          padding: const EdgeInsets.all(25),
          child: CustomActionButton(
            buttonText: 'Place Order',
            onTap: placeOrderOnTap,
          ),
        ),
      ],
    );
  }
}
