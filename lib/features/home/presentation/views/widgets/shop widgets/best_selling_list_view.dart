import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../manager/get best selling/get_best_selling_cubit.dart';
import 'custom_best_selling_list_body.dart';
import 'shimmer_shop_list_view.dart';

class BestSellingListView extends StatelessWidget {
  const BestSellingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBestSellingCubit, GetBestSellingState>(
      builder: (context, state) {
        if (state is GetBestSellingLoading) {
          return const ShimmerShopListView();
        } else if (state is GetBestSellingSuccess) {
          return CustomBestSellingListBody(
            state: state,
          );
        } else if (state is GetBestSellingFailure) {
          return Text(
              'Failed to load best-selling products: ${state.errorMessage}');
        } else {
          return const Text('something ');
        }
      },
    );
  }
}
