import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/core/models/product_item_model.dart';
import 'package:nectar/features/home/data/repos/shop_repo.dart';
part 'get_exclusive_offer_state.dart';

class GetExclusiveOfferCubit extends Cubit<GetExclusiveOfferState> {
  GetExclusiveOfferCubit(this.shopRepo) : super(GetExclusiveOfferInitial());
  final ShopRepo shopRepo;
  getExclusiveOffer() async {
    emit(GetExclusiveOfferLoading());
    var responce = await shopRepo.fetchExclusiveOfferProducts();
    responce.fold((failure) {
      emit(GetExclusiveOfferFailure(errorMessage: failure));
    }, (products) {
      emit(GetExclusiveOfferSuccess(products: products));
    });
  }
}
