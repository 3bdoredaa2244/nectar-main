import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/core/widgets/custom_button.dart';
import '../../../../data/models/user details model/user_details.dart';
import '../../../manager/get user details cubit/get_user_details_cubit.dart';
import '../../../manager/uploud image cubit/uploud_image_cubit.dart';
import 'custom_add_image.dart';
import 'custom_alert_dialog.dart';
import 'edit_account_appbar.dart';
import 'edit_account_form.dart';

class EditAccountViewBody extends StatefulWidget {
  const EditAccountViewBody({super.key, required this.user});
  final UserDetailsModel user;

  @override
  State<EditAccountViewBody> createState() => _EditAccountViewBodyState();
}

class _EditAccountViewBodyState extends State<EditAccountViewBody> {
  late String newName;
  late String newPhotoUrl;
  void _showAlertDialog(BuildContext context) {
    showDialog(
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) {
        return customAlertDialog(context);
      },
    );
  }

  void _updateProfile(BuildContext context) {
    if (BlocProvider.of<UploudImageCubit>(context).myUrl != null) {
      widget.user.photo = BlocProvider.of<UploudImageCubit>(context).myUrl;
      FirebaseAuth.instance.currentUser!
          .updatePhotoURL(BlocProvider.of<UploudImageCubit>(context).myUrl!);
    }
    widget.user.name = nameController.text;
    FirebaseAuth.instance.currentUser!.updateDisplayName(nameController.text);
    widget.user.save();
    log("${BlocProvider.of<UploudImageCubit>(context).myUrl}");
    BlocProvider.of<GetUserDetailsCubit>(context)
        .getUserDetails(widget.user.id);
    GoRouter.of(context).pop();
  }

  Timer? _timer;
  late TextEditingController nameController;
  @override
  void initState() {
    nameController = TextEditingController(text: widget.user.name);
    newName = nameController.text;
    newPhotoUrl = widget.user.photo!;
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const EditAccountAppbar(),
            const Gap(40),
            BlocConsumer<UploudImageCubit, UploudImageState>(
              listener: (BuildContext context, UploudImageState state) async {
                if (state is UploudImageLoading) {
                  await EasyLoading.show(
                    status: 'Processing...',
                    maskType: EasyLoadingMaskType.black,
                  );
                } else if (state is UploudImageSuccess) {
                  log(state.myUrl);
                  _timer?.cancel();
                  await EasyLoading.dismiss();
                } else {
                  _timer?.cancel();
                  await EasyLoading.dismiss();
                }
              },
              builder: (context, state) {
                if (state is UploudImageSuccess) {
                  return CustomAddImage(
                    imageUrl: state.myUrl,
                    onPressed: () => _showAlertDialog(context),
                  );
                } else {
                  return CustomAddImage(
                    imageUrl: widget.user.photo!,
                    onPressed: () => _showAlertDialog(context),
                  );
                }
              },
            ),
            const Gap(
              20,
            ),
            EditAccountForm(
              user: widget.user,
              nameController: nameController,
            ),
            const Gap(60),
            BlocBuilder<UploudImageCubit, UploudImageState>(
              builder: (context, state) {
                return AnimatedOpacity(
                  opacity: (newName != nameController.text ||
                          (newPhotoUrl !=
                                  BlocProvider.of<UploudImageCubit>(context)
                                      .myUrl &&
                              BlocProvider.of<UploudImageCubit>(context)
                                      .myUrl !=
                                  null))
                      ? 1
                      : 0.2,
                  duration: const Duration(milliseconds: 300),
                  child: CustomActionButton(
                      buttonText: 'Update',
                      onTap: () {
                        if (newName != nameController.text ||
                            (newPhotoUrl !=
                                    BlocProvider.of<UploudImageCubit>(context)
                                        .myUrl &&
                                BlocProvider.of<UploudImageCubit>(context)
                                        .myUrl !=
                                    null)) {
                          _updateProfile(context);
                        }
                      }),
                );
              },
            ),
            const Gap(20)
          ],
        ),
      ),
    );
  }
}
