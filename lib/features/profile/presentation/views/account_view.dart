import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../data/models/account_tile_model.dart';
import '../manager/get user details cubit/get_user_details_cubit.dart';
import 'widgets/account widgets/account_view_body.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});
  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  List<AccountModel> accountItems = [
    AccountModel(
        title: 'Orders', leadingIcon: Icons.local_mall_outlined, onTap: () {}),
    AccountModel(
        title: 'My Details',
        leadingIcon: FontAwesomeIcons.addressCard,
        onTap: () {}),
    AccountModel(
        title: 'Delivery Address',
        leadingIcon: Icons.location_on_outlined,
        onTap: () {}),
    AccountModel(
        title: 'Payment Methods',
        leadingIcon: FontAwesomeIcons.creditCard,
        onTap: () {}),
    AccountModel(
        title: 'Promo Cord', leadingIcon: Icons.sell_outlined, onTap: () {}),
    AccountModel(
        title: 'Notifications',
        leadingIcon: Icons.notification_important_outlined,
        onTap: () {}),
    AccountModel(
        title: 'Help', leadingIcon: Icons.help_outline_outlined, onTap: () {}),
    AccountModel(
        title: 'About', leadingIcon: Icons.info_outlined, onTap: () {}),
  ];
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
    return BlocBuilder<GetUserDetailsCubit, GetUserDetailsState>(
      builder: (context, state) {
        if (state is GetUserDetailsSuccess) {
          return AccountViewBody(
            accountItems: accountItems,
            user: state.user,
          );
        } else if (state is GetUserDetailsLoading) {
          return const CircularProgressIndicator();
        } else if (state is GetUserDetailsFailure) {
          return Text(
              'Failed to load best-selling products: ${state.errorMessage}');
        } else {
          return const SizedBox(
            height: 20,
          );
        }
      },
    );
  }
}
