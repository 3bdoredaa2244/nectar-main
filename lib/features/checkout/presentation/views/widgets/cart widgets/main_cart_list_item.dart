import 'package:flutter/material.dart';
import '../../../../../../core/models/cart_item_model.dart';
import '../../../../../../core/utils/colors.dart';
import 'custom_listview_item.dart';

class MainCartListViewItem extends StatelessWidget {
  const MainCartListViewItem({
    super.key,
    //required this.deleteItem,
    required this.cartItem,
  });

  //final Function deleteItem;
  final CartItemModel cartItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CartListViewItem(
          // deleteItem: deleteItem,
          productItem: cartItem,
        ),
        const Divider(
          height: 1,
          indent: 25,
          endIndent: 25,
          color: AppColors.lightGray,
        )
      ],
    );
  }
}
