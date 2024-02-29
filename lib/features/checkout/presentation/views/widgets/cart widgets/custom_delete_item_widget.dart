import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/widgets/custom_product_title_subtitle.dart';
import '../../../../../home/presentation/views/widgets/product details widgets/custom_appbar_icon.dart';

class CustomDeleteItem extends StatelessWidget {
  const CustomDeleteItem(
      {super.key,
      //required this.deleteItem,
      required this.title,
      required this.type,
      required this.size});
  //final Function deleteItem;
  final String title;
  final String type;
  final num size;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomProductTitleAndSubtitle(
          title: title,
          type: type,
          size: size,
        ),
        const IconDelete(//deleteItem: deleteItem
            )
      ],
    );
  }
}

class IconDelete extends StatelessWidget {
  const IconDelete({
    super.key,
    //required this.deleteItem,
  });

  //final Function deleteItem;

  @override
  Widget build(BuildContext context) {
    return CustomIcon(
      icon: const Icon(
        Icons.close,
        size: 17,
        color: AppColors.pinkSwan,
      ),
      onPressed: () {
        //deleteItem;
      },
    );
  }
}
