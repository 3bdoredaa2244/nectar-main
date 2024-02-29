import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../manager/get user details cubit/get_user_details_cubit.dart';
import 'widgets/edit account widgets/edit_account_view_body.dart';

class EditAccountView extends StatefulWidget {
  const EditAccountView({super.key});

  @override
  State<EditAccountView> createState() => _EditAccountViewState();
}

class _EditAccountViewState extends State<EditAccountView> {
  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String id = sharedPreferences.getString("id")!;
    // ignore: use_build_context_synchronously
    BlocProvider.of<GetUserDetailsCubit>(context).getUserDetails(id);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetUserDetailsCubit, GetUserDetailsState>(
        builder: (context, state) {
          if (state is GetUserDetailsSuccess) {
            return EditAccountViewBody(
              user: state.user,
            );
          } else if (state is GetUserDetailsLoading) {
            return const CircularProgressIndicator();
          } else if (state is GetUserDetailsFailure) {
            return Text(
                'Failed to load best-selling products: ${state.errorMessage}');
          } else {
            return const SizedBox(
              height: 50,
            );
          }
        },
      ),
    );
  }
}
