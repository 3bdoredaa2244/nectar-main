import 'package:flutter/material.dart';
import 'package:nectar/core/function/cache_network_image.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../data/models/user details model/user_details.dart';
import 'user_name.dart';

class UserDetailsListTile extends StatelessWidget {
  const UserDetailsListTile({
    super.key,
    required this.user,
  });
  final UserDetailsModel user;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 114,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(27),
          child: cachedMyNetworkImage(
              imageUrl: user.photo!, height: 64, width: 64),
        ),
        title: CustomUserName(
          user: user,
        ),
        subtitle: Text(
          user.email ?? 'undefined',
          style: Styles.styleMagnoliaWhite16
              .copyWith(color: AppColors.grey, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
