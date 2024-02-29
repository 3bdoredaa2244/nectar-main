import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../core/models/product_item_model.dart';
import '../../../manager/delete favourite cubit/delete_favourite_cubit.dart';
import '../../../manager/get favorites cubit/get_favorites_cubit.dart';
import '../../../manager/get favourite products/get_favourite_products_cubit.dart';
import 'favourite_listview_item.dart';
import 'favourite_shimmer_list_view.dart';

class FavouriteProductsListView extends StatefulWidget {
  const FavouriteProductsListView({super.key});
  @override
  State<FavouriteProductsListView> createState() =>
      _FavouriteProductsListViewState();
}

class _FavouriteProductsListViewState extends State<FavouriteProductsListView> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final ScrollController _scrollController = ScrollController();
  List<ProductItemModel> products = [];
  String userId = '';
  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String id = sharedPreferences.getString("id")!;
    userId = id;
    // ignore: use_build_context_synchronously
    BlocProvider.of<GetFavoritesCubit>(context).fetchFavoriteProducts(user: id);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetFavoritesCubit, GetFavoritesState>(
      listener: (context, favouriteState) {
        if (favouriteState is GetFavoritesSuccess) {
          BlocProvider.of<GetFavouriteProductsCubit>(context)
              .getFavoriteProducts(favouriteState.productsIdList);
        } else if (favouriteState is GetFavoritesFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(favouriteState.errorMessage)));
        }
      },
      builder: (context, favouriteState) {
        return BlocConsumer<GetFavouriteProductsCubit,
            GetFavouriteProductsState>(
          listener: (BuildContext context, GetFavouriteProductsState state) {
            if (state is GetFavouriteProductsSuccess) {
              products = state.products;
            } else if (state is GetFavouriteProductsFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
              log(state.errorMessage);
            }
          },
          builder: (context, state) {
            if (state is GetFavouriteProductsLoading ||
                favouriteState is GetFavoritesLoading) {
              return const FavouriteShimmerListview();
            } else if (state is GetFavouriteProductsSuccess &&
                products.isNotEmpty) {
              return AnimatedList(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  initialItemCount: products.length,
                  key: _listKey,
                  itemBuilder: ((context, index, animation) {
                    return Slidable(
                        startActionPane:
                            ActionPane(motion: const BehindMotion(), children: [
                          SlidableAction(
                            onPressed: (context) async {
                              deleteItem(index: index);
                              await BlocProvider.of<DeleteFavouriteCubit>(
                                      context)
                                  .deleteFavourite(
                                      userId: userId,
                                      productId: products[index].id!);
                              log('success delete');
                            },
                            icon: Icons.delete,
                            backgroundColor: Colors.red,
                            label: "Delete",
                          ),
                        ]),
                        child: customFavoriteItem(animation, index));
                  }));
            } else if (favouriteState is GetFavoritesEmpty) {
              return Lottie.asset('assets/animations/empty1.json');
            } else {
              return const Center(child: Text(''));
            }
          },
        );
      },
    );
  }

  Widget customFavoriteItem(Animation<double> animation, int index) {
    return Builder(
      builder: (BuildContext context) => SlideTransition(
          position: animation.drive(Tween<Offset>(
              begin: const Offset(1, 0), end: const Offset(0, 0))),
          child: FavouriteProductsListViewItem(
            deleteItem: deleteItem,
            product: products[index],
            onPressed: () {
              final slidable = Slidable.of(context);
              final isClosed =
                  slidable?.actionPaneType.value == ActionPaneType.none;
              if (isClosed) {
                slidable?.openStartActionPane();
              } else {
                slidable?.close();
              }
            },
          )),
    );
  }

  void deleteItem({required int index}) {
    //var itemValue = products.removeAt(index);
    _listKey.currentState!.removeItem(index, (_, animation) {
      return SizeTransition(
          sizeFactor: animation,
          child: FavouriteProductsListViewItem(
              deleteItem: deleteItem, product: products[index]));
    });
  }
}
