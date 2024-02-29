import 'package:flutter/widgets.dart';
import '../../../../../../core/widgets/custom_authentication_textformfield.dart';

class EditAccountInputDetails extends StatefulWidget {
  const EditAccountInputDetails({
    super.key,
    required this.autovalidateMode,
    required this.nameController,
  });
  final AutovalidateMode autovalidateMode;
  final TextEditingController nameController;
  @override
  State<EditAccountInputDetails> createState() =>
      _EditAccountInputDetailsState();
}

class _EditAccountInputDetailsState extends State<EditAccountInputDetails> {
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomAuthenticationTextformfield(
          autovalidateMode: widget.autovalidateMode,
          controller: widget.nameController,
          type: TextInputType.name,
          label: 'name',
          validate: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please enter your name';
            } else {
              return null;
            }
          },
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
