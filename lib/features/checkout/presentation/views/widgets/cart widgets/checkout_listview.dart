import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_divider.dart';
import '../../../../../home/data/models/expansion_tile_model.dart';

class CheckoutListView extends StatelessWidget {
  const CheckoutListView({
    super.key,
    required this.expansionItems,
  });
  final List<ExpansionTileModel> expansionItems;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ExpansionTile(
            tilePadding: EdgeInsets.zero,
            title: Text(
              expansionItems[index].title,
              style: Styles.styleBlackRussian18.copyWith(color: AppColors.grey),
            ),
            trailing: Text(expansionItems[index].trailing,
                style: Styles.styleBlackRussian18),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const CustomDivider();
      },
      itemCount: expansionItems.length,
    );
  }
}
