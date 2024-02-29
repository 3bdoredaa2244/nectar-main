import 'package:flutter/material.dart';
import 'package:nectar/features/profile/data/models/account_tile_model.dart';

import '../../../../../../core/utils/colors.dart';
import 'listview_item.dart';

class AccountListview extends StatelessWidget {
  const AccountListview({super.key, required this.accountItems});
  final List<AccountModel> accountItems;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return ListviewItem(
          accountItem: accountItems[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          height: 1,
          color: AppColors.lightGray,
        );
      },
      itemCount: accountItems.length,
    );
  }
}
