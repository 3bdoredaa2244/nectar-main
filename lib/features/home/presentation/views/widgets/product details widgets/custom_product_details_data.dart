import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/core/models/cart_item_model.dart';
import 'package:nectar/core/models/product_item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../manager/add cart cubit/add_cart_cubit.dart';
import '../../../manager/control count cubit/control_count_cubit.dart';
import 'custom_control_product_count.dart';
import 'custom_nutritions_tile.dart';
import 'custom_product_detail_tile.dart';
import 'custom_product_details_content.dart';
import 'custom_review_tile.dart';

class CustomProductDetailsData extends StatelessWidget {
  const CustomProductDetailsData({super.key, required this.product});

  final ProductItemModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
      child: SizedBox(
        width: double.infinity,
        child: CustomProductDetailsDataContent(
          product: product,
        ),
      ),
    );
  }
}

class CustomProductDetailsDataContent extends StatefulWidget {
  const CustomProductDetailsDataContent({
    super.key,
    required this.product,
  });

  final ProductItemModel product;

  @override
  State<CustomProductDetailsDataContent> createState() =>
      _CustomProductDetailsDataContentState();
}

class _CustomProductDetailsDataContentState
    extends State<CustomProductDetailsDataContent> {
  String? userId;
  getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String id = sharedPreferences.getString("id")!;
    userId = id;
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductDetailsContent(
          product: widget.product,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomControlProductCount(
          product: widget.product,
        ),
        const SizedBox(
          height: 30,
        ),
        CustomProductDetailTile(product: widget.product),
        CustomNutritionsTile(product: widget.product),
        CustomReviewTile(product: widget.product),
        const SizedBox(
          height: 10,
        ),
        BlocBuilder<ControlCountCubit, ControlCountState>(
          builder: (context, state) {
            return AnimatedOpacity(
              opacity: BlocProvider.of<ControlCountCubit>(context).count > 0
                  ? 1
                  : .2,
              duration: const Duration(milliseconds: 300),
              child: CustomActionButton(
                buttonText: 'Add To Basket',
                onTap: () async {
                  if (userId != null &&
                      BlocProvider.of<ControlCountCubit>(context).count > 0) {
                    await BlocProvider.of<AddCartCubit>(context).addCart(
                        CartItemModel(
                            userId: userId!,
                            productId: widget.product.id!,
                            price: widget.product.offerPrice > 0
                                ? widget.product.offerPrice
                                : widget.product.price,
                            imageUrl: widget.product.imageUrl ??
                                "https://demofree.sirv.com/nope-not-here.jpg",
                            title: widget.product.title,
                            count: BlocProvider.of<ControlCountCubit>(context)
                                .count,
                            totalPrice:
                                BlocProvider.of<ControlCountCubit>(context)
                                    .total,
                            size: widget.product.size,
                            type: widget.product.type));
                    GoRouter.of(context).pop();
                  }
                },
              ),
            );
          },
        )
      ],
    );
  }
}
