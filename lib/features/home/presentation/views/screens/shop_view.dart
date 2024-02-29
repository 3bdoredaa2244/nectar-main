import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/core/widgets/custom_textformfield.dart';
import '../../manager/get best selling/get_best_selling_cubit.dart';
import '../../manager/get exclusive offer cubit/get_exclusive_offer_cubit.dart';
import '../../manager/get groceries/get_groceries_cubit.dart';
import '../widgets/shop widgets/best_selling_list_view.dart';
import '../widgets/shop widgets/custom_exclusive_offer.dart';
import '../widgets/shop widgets/exclusive_offer_list_view.dart';
import '../widgets/shop widgets/groceries_list_view.dart';
import '../widgets/shop widgets/shop_view_appbar.dart';
import '../widgets/shop widgets/toggling_offers_imgae.dart';

class ShopView extends StatefulWidget {
  const ShopView({super.key});

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  List<String> items = [
    'assets/images/adv1.jpg',
    'assets/images/adv2.jpg',
    'assets/images/adv4.jpg',
  ];
  @override
  void initState() {
    BlocProvider.of<GetBestSellingCubit>(context).getBestSelling();
    BlocProvider.of<GetExclusiveOfferCubit>(context).getExclusiveOffer();
    BlocProvider.of<GetGroceriesCubit>(context).getGroceries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
              child: ShopViewAppBar(
            location: 'fayoum ',
          )),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: CustomTextFormField(onChanged: (value) {}),
            ),
          ),
          SliverToBoxAdapter(
            child: ToggolingOffersImage(
              items: items,
              fitImage: BoxFit.fill,
              spaceBottom: 9,
            ),
          ),
          const SliverToBoxAdapter(
              child: ProductTitleRow(
            title: 'Groceries',
          )),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 25),
              child: GroceriesListView(),
            ),
          ),
          const SliverToBoxAdapter(
              child: ProductTitleRow(
            title: 'Exclusive Offer',
          )),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 25),
              child: ExclusiveOfferListView(),
            ),
          ),
          const SliverToBoxAdapter(
              child: ProductTitleRow(
            title: 'Best Selling',
          )),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 25),
              child: BestSellingListView(),
            ),
          ),
        ],
      ),
    );
  }
}
