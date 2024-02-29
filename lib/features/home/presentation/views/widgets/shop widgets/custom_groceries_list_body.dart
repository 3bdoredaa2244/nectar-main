import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/utils/app_routes.dart';
import '../../../manager/get groceries/get_groceries_cubit.dart';
import 'custom_shop_card.dart';

class CustomGroceriesListBody extends StatelessWidget {
  const CustomGroceriesListBody({
    super.key,
    required this.state,
  });
  final GetGroceriesSuccess state;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: CustomGroceriesContentListBody(state: state),
    );
  }
}

class CustomGroceriesContentListBody extends StatelessWidget {
  const CustomGroceriesContentListBody({
    super.key,
    required this.state,
  });

  final GetGroceriesSuccess state;

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
