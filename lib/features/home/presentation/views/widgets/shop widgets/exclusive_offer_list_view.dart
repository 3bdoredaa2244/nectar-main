import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../manager/get exclusive offer cubit/get_exclusive_offer_cubit.dart';
import 'custom_exclusive_offer_list_body.dart';
import 'shimmer_shop_list_view.dart';

class ExclusiveOfferListView extends StatelessWidget {
  const ExclusiveOfferListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetExclusiveOfferCubit, GetExclusiveOfferState>(
      builder: (context, state) {
        if (state is GetExclusiveOfferLoading) {
          return const ShimmerShopListView();
        } else if (state is GetExclusiveOfferSuccess) {
          return CustomExclusiveOfferListBody(state: state);
        } else if (state is GetExclusiveOfferFailure) {
          return Text(
              'Failed to load best-selling products: ${state.errorMessage}');
        } else {
          return const Text('something ');
        }
      },
    );
  }
}
