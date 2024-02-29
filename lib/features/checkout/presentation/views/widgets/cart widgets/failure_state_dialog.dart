import 'package:flutter/widgets.dart';
import 'animated_dialog.dart';

failureStateDialog({required BuildContext context}) {
  animatedDialog(
    context: context,
    // ignore: use_build_context_synchronously
    width: MediaQuery.of(context).size.width - 60,
    massege: 'Something went tembly wrong.',
    title: 'Oops! Order Failed',
    text2: 'Try Again',
    animation: 'failure',
  );
}
