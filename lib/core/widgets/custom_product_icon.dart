import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/home/presentation/manager/change favourite cubit/change_favourite_cubit.dart';
import '../../features/home/presentation/manager/manage favourite cubit/manage_favourite_cubit.dart';
import '../../features/home/presentation/views/widgets/product details widgets/custom_appbar_icon.dart';
import 'shimmer_skelton.dart';
import '../models/product_item_model.dart';
import '../utils/colors.dart';

class CustomProductIcon extends StatefulWidget {
  const CustomProductIcon({super.key, required this.product});
  final ProductItemModel product;
  @override
  State<CustomProductIcon> createState() => _CustomProductIconState();
}

class _CustomProductIconState extends State<CustomProductIcon> {
  bool isFavorite = false;
  @override
  void initState() {
    BlocProvider.of<ChangeFavouriteCubit>(context)
        .fetchFavoriteProducts(productId: widget.product.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangeFavouriteCubit, ChangeFavouriteState>(
      listener: (BuildContext context, ChangeFavouriteState changedState) {
        if (changedState is ChangeFavouriteSuccess) {
          isFavorite =
              BlocProvider.of<ChangeFavouriteCubit>(context).isFavorite;
          BlocProvider.of<ManageFavouriteCubit>(context).isFavorite =
              isFavorite;
        }
      },
      builder: (context, changedState) {
        return BlocConsumer<ManageFavouriteCubit, ManageFavouriteState>(
          listener: (BuildContext context, ManageFavouriteState state) {
            isFavorite =
                BlocProvider.of<ManageFavouriteCubit>(context).isFavorite!;
          },
          builder: (context, state) {
            if (state is ManageFavouriteLoading ||
                changedState is ChangeFavouriteLoading) {
              return customSkelton(width: 30.r, height: 30.r);
            } else if (state is ManageFavouriteSuccess ||
                changedState is ChangeFavouriteSuccess) {
              return CustomIcon(
                onPressed: () async {
                  BlocProvider.of<ManageFavouriteCubit>(context)
                      .toggleFavoriteStatus(productId: widget.product.id!);
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                  size: 30.r,
                ),
                iconColor: isFavorite ? Colors.red : AppColors.grey,
              );
            } else {
              return const Text('wrong');
            }
          },
        );
      },
    );
  }
}
