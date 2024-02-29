import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:nectar/features/product%20category/presentation/views/widgets/products_grid_view_body.dart';

import '../../manager/get product category cubit/get_product_category_cubit.dart';
import 'product_shimmer_grid_view.dart';

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({super.key, required this.categoryName});
  final String categoryName;

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  @override
  void initState() {
    BlocProvider.of<GetProductCategoryCubit>(context)
        .getProductCategory(category: widget.categoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductCategoryCubit, GetProductCategoryState>(
      builder: (context, state) {
        if (state is GetProductCategoryLoading) {
          return const CustomShimmerGridView();
        } else if (state is GetProductCategorySuccess) {
          return ProductGridViewBody(
            products: state.products,
          );
        } else if (state is GetProductCategoryEmpty) {
          return Lottie.asset('assets/animations/empty1.json');
        } else {
          return const Text('');
        }
      },
    );
  }
}
