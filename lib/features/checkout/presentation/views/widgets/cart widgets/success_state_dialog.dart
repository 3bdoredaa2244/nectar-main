import 'dart:developer';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'animated_dialog.dart';

successStateDialog({required BuildContext dialogContext}) {
  animatedDialog(
    context: dialogContext,
    width: MediaQuery.of(dialogContext).size.width - 60,
    onTap1: () {
      log("//////////1");
      Navigator.of(dialogContext).pop();
      /*WidgetsBinding.instance.addPostFrameCallback((_) {
        //GoRouter.of(dialogContext).pushReplacement(AppRoutes.homeView);
        log("//////////2");
      });*/
    },
  );
  AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 0,
          channelKey: 'nectar',
          title: 'Successful order',
          body:
              'Congratulation !, your order create successfully and it will sended to you in an hour'));
}
