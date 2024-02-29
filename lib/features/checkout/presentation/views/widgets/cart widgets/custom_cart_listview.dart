import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../core/models/cart_item_model.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../home/presentation/manager/count total order cubit/count_total_order_cubit.dart';
import '../../../manager/delete cart cubit/delete_cart_cubit.dart';
import 'cart_shimmer_list_view.dart';
import 'main_cart_list_item.dart';

class CartListView extends StatefulWidget {
  const CartListView({
    super.key,
  });
  @override
  State<CartListView> createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late List<CartItemModel> cartItems;
  num total = 0;
  changeTotal() {
    BlocProvider.of<CountTotalOrderCubit>(context).cartItems = cartItems;
    BlocProvider.of<CountTotalOrderCubit>(context).generalTotalPrice = total;
    BlocProvider.of<CountTotalOrderCubit>(context).countTotal();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(cartCollection)
            .where("userId", isEqualTo: myuserId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CartShimmerListview();
          } else if (snapshot.hasData) {
            cartItems = snapshot.data!.docs
                .map((item) => CartItemModel.fromSnapShot(item))
                .toList();
            changeTotal();

            log('user id : $myuserId');
            log('success get');
            return ListView.builder(
                key: _listKey,
                itemCount: snapshot.data!.docs.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Slidable(
                        startActionPane:
                            ActionPane(motion: const BehindMotion(), children: [
                          SlidableAction(
                            onPressed: (context) async {
                              await BlocProvider.of<DeleteCartCubit>(context)
                                  .deleteCart(
                                      cart: cartItems[index], userId: myuserId);
                              log('success delete');
                              log('${cartItems.length}');
                            },
                            icon: Icons.delete,
                            backgroundColor: Colors.red,
                            label: "Delete",
                          ),
                        ]),
                        child: customFavoriteItem(index)),
                  );
                }));
          } else if (snapshot.hasError) {
            return const Text('error');
          } else if (cartItems.isEmpty) {
            return Lottie.asset('assets/animations/empty1.json');
          }
          return const Text('undefined');
        });
  }

  Widget customFavoriteItem(int index) {
    return Builder(
      builder: (BuildContext context) => MainCartListViewItem(
        cartItem: cartItems[index],
      ),
    );
  }
}

/*import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:nectar/features/profile/presentation/manager/get%20user%20details%20cubit/get_user_details_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../core/models/cart_item_model.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../home/presentation/manager/count total order cubit/count_total_order_cubit.dart';
import '../../../manager/delete cart cubit/delete_cart_cubit.dart';
import '../../../manager/get carts cubit/get_carts_cubit.dart';
import 'cart_shimmer_list_view.dart';
import 'main_cart_list_item.dart';

class CartListView extends StatefulWidget {
  const CartListView({
    super.key,
  });
  @override
  State<CartListView> createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final ScrollController _scrollController = ScrollController();
  List<CartItemModel> carts = [];
  String userId = '';
  num total = 0;
  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String id = sharedPreferences.getString("id")!;
    userId = id;
    myuserId = id;
    BlocProvider.of<GetUserDetailsCubit>(context).getUserDetails(userId);
    // ignore: use_build_context_synchronously
    BlocProvider.of<GetCartsCubit>(context).getCarts(userId: userId);
  }

  changeTotal() {
    BlocProvider.of<CountTotalOrderCubit>(context).cartItems = carts;
    BlocProvider.of<CountTotalOrderCubit>(context).generalTotalPrice = total;
    BlocProvider.of<CountTotalOrderCubit>(context).countTotal();
  }

  @override
  void initState() {
    getData();
    gCarts = [];
    super.initState();
  }

  @override
  /*void didChangeDependencies() async {
    await BlocProvider.of<GetCartsCubit>(context).getCarts(userId: userId);
    changeTotal();
    super.didChangeDependencies();
  }*/

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetUserDetailsCubit, GetUserDetailsState>(
      listener: (context, state) {
        if (state is GetUserDetailsSuccess) {
          myCustomerId = state.user.customerId!;
        }
      },
      child: BlocConsumer<GetCartsCubit, GetCartsState>(
        listener: (BuildContext context, GetCartsState state) {
          if (state is GetCartsSuccess) {
            carts = state.carts;
            gCarts = state.carts;
            changeTotal();
          } else if (state is GetCartsFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          if (state is GetCartsLoading) {
            return const CartShimmerListview();
          } else if (state is GetCartsSuccess && carts.isNotEmpty) {
            return AnimatedList(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                initialItemCount: carts.length,
                key: _listKey,
                itemBuilder: ((context, index, animation) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Slidable(
                        startActionPane:
                            ActionPane(motion: const BehindMotion(), children: [
                          SlidableAction(
                            onPressed: (context) async {
                              deleteItem(index: index);
                              await BlocProvider.of<DeleteCartCubit>(context)
                                  .deleteCart(
                                      cart: carts[index], userId: userId);
                              log('success delete');
                              log('${carts.length}');
                            },
                            icon: Icons.delete,
                            backgroundColor: Colors.red,
                            label: "Delete",
                          ),
                        ]),
                        child: customFavoriteItem(animation, index)),
                  );
                }));
          } else if (state is GetCartsSuccess && state.carts.isEmpty) {
            return Lottie.asset('assets/animations/empty1.json');
          } else {
            return const Text('');
          }
        },
      ),
    );
  }

  Widget customFavoriteItem(Animation<double> animation, int index) {
    return Builder(
      builder: (BuildContext context) => SlideTransition(
          position: animation.drive(Tween<Offset>(
              begin: const Offset(1, 0), end: const Offset(0, 0))),
          child: MainCartListViewItem(
            deleteItem: deleteItem,
            cartItem: carts[index],
          )),
    );
  }

  void deleteItem({required int index}) {
    _listKey.currentState!.removeItem(index, (_, animation) {
      return SizeTransition(
          sizeFactor: animation,
          child: MainCartListViewItem(
              deleteItem: deleteItem, cartItem: carts[index]));
    });
  }
}*/