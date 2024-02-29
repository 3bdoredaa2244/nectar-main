import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/core/utils/app_routes.dart';
import '../../../manager/get best selling/get_best_selling_cubit.dart';
import 'custom_shop_card.dart';

class CustomBestSellingListBody extends StatelessWidget {
  const CustomBestSellingListBody({
    super.key,
    required this.state,
  });
  final GetBestSellingSuccess state;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: CustomBestSellingContentListBody(state: state),
    );
  }
}

class CustomBestSellingContentListBody extends StatelessWidget {
  const CustomBestSellingContentListBody({
    super.key,
    required this.state,
  });

  final GetBestSellingSuccess state;

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
