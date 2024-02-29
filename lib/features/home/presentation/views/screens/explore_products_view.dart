import 'package:flutter/material.dart';
import '../../../data/models/category_model.dart';
import '../widgets/explore products widgets/explore_products_view_body.dart';

class ExploreProductsView extends StatefulWidget {
  const ExploreProductsView({super.key});

  @override
  State<ExploreProductsView> createState() => _ExploreProductsViewState();
}

class _ExploreProductsViewState extends State<ExploreProductsView> {
  TextEditingController searchController = TextEditingController();
  List<CategoryModel> categoriesItems = [
    CategoryModel('Meat,Poultry & Seafood', 'fish.jpeg'),
    CategoryModel('Freezer', 'frozen.jpeg'),
    CategoryModel('Cooking Oil& Ghee', 'oil.png'),
    CategoryModel('Fruits & vegetables', 'fruits.webp'),
    CategoryModel('Dairy & Eggs', 'dairy.png'),
    CategoryModel('Bakery', 'bakery.png'),
    CategoryModel('Beverages', 'bevarges.png'),
    CategoryModel('Desserts & Snacks', 'sweets.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return ExploreProductsViewBody(
      searchController: searchController,
      categoriesItems: categoriesItems,
    );
  }
}
