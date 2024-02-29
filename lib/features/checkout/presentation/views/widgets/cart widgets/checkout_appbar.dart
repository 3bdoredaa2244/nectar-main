import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_routes.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../home/presentation/views/widgets/product details widgets/custom_appbar_icon.dart';

class CheckOutAppBar extends StatelessWidget {
  const CheckOutAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 25, top: 10, bottom: 15),
      child: Row(
        children: [
          Text(
            'Checkout',
            style: Styles.stylebBackRussian24,
          ),
          const Spacer(),
          CustomIcon(
            icon: const Icon(
              Icons.close,
              size: 17,
              color: AppColors.blackRussian,
            ),
            onPressed: () {
              AppRoutes.router.pop();
            },
          ),
        ],
      ),
    );
  }
}
