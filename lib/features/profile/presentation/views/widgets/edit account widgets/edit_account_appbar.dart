import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../home/presentation/views/widgets/product details widgets/custom_appbar_icon.dart';

class EditAccountAppbar extends StatelessWidget {
  const EditAccountAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomIcon(
              icon: const Icon(
                FontAwesomeIcons.angleLeft,
                color: AppColors.blackRussian,
              ),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
          ],
        ));
  }
}
