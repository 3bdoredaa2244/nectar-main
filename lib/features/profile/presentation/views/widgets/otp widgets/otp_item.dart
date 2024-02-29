import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../../core/utils/colors.dart';

class OtpItem extends StatelessWidget {
  const OtpItem({
    Key? key,
    required this.otpController,
    required this.isFirst,
    required this.isLast,
  }) : super(key: key);
  final bool isFirst;
  final bool isLast;
  final TextEditingController otpController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.sizeOf(context).width - 50) / 7,
      height: (MediaQuery.sizeOf(context).height - 50) / 7,
      child: TextFormField(
        cursorColor: AppColors.oceanGreen,
        controller: otpController,
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        onChanged: (value) {
          if (value.length == 1 && isLast != true) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && isFirst != true) {
            FocusScope.of(context).previousFocus();
          }
        },
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: const InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(9)),
            borderSide: BorderSide(color: AppColors.oceanGreen),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(9)),
            borderSide: BorderSide(color: AppColors.oceanGreen),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(9)),
            borderSide: BorderSide(color: AppColors.grey),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(19)),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        onSaved: (value) {},
      ),
    );
  }
}
