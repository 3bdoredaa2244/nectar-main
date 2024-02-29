import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../manager/get groceries/get_groceries_cubit.dart';
import 'custom_groceries_list_body.dart';
import 'shimmer_shop_list_view.dart';

class GroceriesListView extends StatelessWidget {
  const GroceriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetGroceriesCubit, GetGroceriesState>(
      builder: (context, state) {
        if (state is GetGroceriesLoading) {
          return const ShimmerShopListView();
        } else if (state is GetGroceriesSuccess) {
          return CustomGroceriesListBody(state: state);
        } else if (state is GetGroceriesFailure) {
          return Text(
              'Failed to load best-selling products: ${state.errorMessage}');
        } else {
          return const Text('something ');
        }
      },
    );
  }
}
