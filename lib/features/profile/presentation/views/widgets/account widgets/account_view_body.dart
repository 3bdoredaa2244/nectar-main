import 'package:flutter/material.dart';
import 'package:nectar/features/profile/data/models/user%20details%20model/user_details.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../data/models/account_tile_model.dart';
import 'account_list_view.dart';
import 'logout_button.dart';
import 'user_details_listtile.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody(
      {super.key, required this.accountItems, required this.user});
  final List<AccountModel> accountItems;
  final UserDetailsModel user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          UserDetailsListTile(
            user: user,
          ),
          const Divider(
            height: 1,
            color: AppColors.lightGray,
          ),
          Expanded(
              child: AccountListview(
            accountItems: accountItems,
          )),
          const LogoutAccountButton()
        ],
      ),
    );
  }
}
