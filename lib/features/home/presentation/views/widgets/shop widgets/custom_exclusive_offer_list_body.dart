import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/utils/app_routes.dart';
import '../../../manager/get exclusive offer cubit/get_exclusive_offer_cubit.dart';
import 'custom_shop_card.dart';

class CustomExclusiveOfferListBody extends StatelessWidget {
  const CustomExclusiveOfferListBody({
    super.key,
    required this.state,
  });
  final GetExclusiveOfferSuccess state;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: CustomExclusiveOfferContentListBody(state: state),
    );
  }
}

class CustomExclusiveOfferContentListBody extends StatelessWidget {
  const CustomExclusiveOfferContentListBody({
    super.key,
    required this.state,
  });

  final GetExclusiveOfferSuccess state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: state.products.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final product = state.products[index];
        return GestureDetector(
          onTap: () {
            GoRouter.of(context)
                .push(AppRoutes.productDetailsView, extra: product);
          },
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 15),
            child: CustomShopCard(
              product: product,
            ),
          ),
        );
      },
    );
  }
}
