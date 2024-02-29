import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/styles.dart';

PreferredSizeWidget? customAppbar(
        {required BuildContext context, String? appbarTitle}) =>
    AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      title: Text(
        appbarTitle ?? '',
        style: Styles.stylebBackRussian24,
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Center(
            child: SvgPicture.asset(
          'assets/images/Arrow 1.svg',
          colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
          height: 24,
        )),
      ),
    );
