import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/features/profile/presentation/views/account_view.dart';
import 'package:nectar/features/checkout/presentation/views/cart_view.dart';
import 'package:nectar/features/home/presentation/views/screens/explore_products_view.dart';
import 'package:nectar/features/home/presentation/views/screens/favourite_products_view.dart';
import 'package:nectar/features/home/presentation/views/screens/shop_view.dart';
part 'manage_navigation_state.dart';

class ManageNavigationCubit extends Cubit<ManageNavigationState> {
  ManageNavigationCubit() : super(ManageNavigationInitial());
  static ManageNavigationCubit get(context) => BlocProvider.of(context);
  List<Widget> bottmScreen = [
    const ShopView(),
    const ExploreProductsView(),
    const CartView(
      cartItems: [],
    ),
    const FavouriteProductsView(
      cartItems: [],
    ),
    const AccountView(
        //userId: userId,
        )
  ];
  int currentIndex = 0;
  void manageNavigationHomeScreen(int index) {
    currentIndex = index;
    emit(ManageNavigationChange());
  }
}
/*class ManageNavigationCubit extends Cubit<ManageNavigationState> {
  ManageNavigationCubit(this.userId) : super(ManageNavigationInitial());

  static ManageNavigationCubit get(context) => BlocProvider.of(context);

  final String userId;
  List<Widget> bottomScreen = [
    const ShopView(),
    const ExploreProductsView(),
    const CartView(
      cartItems: [],
    ),
    const FavouriteProductsView(
      cartItems: [],
    ),
  ];

  int currentIndex = 0;

  List<Widget> get bottomScreenWithAccountView {
    return [
      ...bottomScreen,
      AccountView(userId: userId),
    ];
  }

  void manageNavigationHomeScreen(int index) {
    currentIndex = index;
    emit(ManageNavigationChange());
  }
}*/
