import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/features/home/data/repos/shop_repo.dart';
import '../../../../../core/models/product_item_model.dart';
part 'get_best_selling_state.dart';

class GetBestSellingCubit extends Cubit<GetBestSellingState> {
  GetBestSellingCubit(this.shopRepo) : super(GetBestSellingInitial());
  final ShopRepo shopRepo;
  getBestSelling() async {
    emit(GetBestSellingLoading());
    var responce = await shopRepo.fetchBestSellerProducts();
    responce.fold((failure) {
      emit(GetBestSellingFailure(errorMessage: failure));
    }, (products) {
      emit(GetBestSellingSuccess(products: products));
    });
  }
}
