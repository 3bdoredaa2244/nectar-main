import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';
import '../../../../data/models/account_tile_model.dart';

class ListviewItem extends StatelessWidget {
  const ListviewItem({super.key, required this.accountItem});
  final AccountModel accountItem;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        accountItem.leadingIcon,
        size: 20,
        color: AppColors.blackRussian,
      ),
      title: Text(
        accountItem.title,
        style: Styles.styleBlackRussian18,
      ),
      trailing: accountItem.trailing ??
          const Icon(
            Icons.chevron_right_outlined,
            size: 20,
            color: AppColors.blackRussian,
          ),
      onTap: accountItem.onTap(),
    );
  }
}
