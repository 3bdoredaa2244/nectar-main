import 'package:flutter/widgets.dart';
import '../../../../data/models/user details model/user_details.dart';
import 'edit_account_input_details.dart';

class EditAccountForm extends StatefulWidget {
  const EditAccountForm({
    super.key,
    required this.user,
    required this.nameController,
  });
  final UserDetailsModel user;
  final TextEditingController nameController;

  @override
  State<EditAccountForm> createState() => _EditAccountFormState();
}

class _EditAccountFormState extends State<EditAccountForm> {
  GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          EditAccountInputDetails(
            autovalidateMode: autovalidateMode,
            nameController: widget.nameController,
          ),
        ],
      ),
    );
  }
}
