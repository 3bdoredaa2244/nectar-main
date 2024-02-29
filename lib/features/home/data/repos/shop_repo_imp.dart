import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:nectar/core/models/product_item_model.dart';
import 'package:nectar/features/home/data/repos/shop_repo.dart';

import '../../../../core/utils/constants.dart';

class ShopRepoImp implements ShopRepo {
  final FirebaseFirestore _fb = FirebaseFirestore.instance;
  @override
  Future<Either<String, List<ProductItemModel>>>
      fetchBestSellerProducts() async {
    try {
      var response = await _fb
          .collection(productCollection)
          .where("rate", isGreaterThan: 3)
          .get();
      List<ProductItemModel> products = response.docs
          .map((element) => ProductItemModel.fromSnapShot(element))
          .toList();
      if (products == []) {
        debugPrint(
            '/////////////////////////////products is emprty //////////////////////////');
      }
      return right(products);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ProductItemModel>>>
      fetchExclusiveOfferProducts() async {
    try {
      var response = await _fb
          .collection(productCollection)
          .where("offerPrice", isGreaterThan: 0)
          .get();
      List<ProductItemModel> products = response.docs
          .map((element) => ProductItemModel.fromSnapShot(element))
          .toList();
      if (products == []) {
        debugPrint(
            '/////////////////////////////products is emprty //////////////////////////');
      }
      return right(products);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ProductItemModel>>> fetchFavoriteProducts(
      List<String> favoriteIds) async {
    try {
      var response = await _fb
          .collection(productCollection)
          .where(FieldPath.documentId, whereIn: favoriteIds)
          .get();
      List<ProductItemModel> products = response.docs
          .map((element) => ProductItemModel.fromSnapShot(element))
          .toList();
      if (products.isEmpty) {
        debugPrint(
            '/////////////////////////////products is empty //////////////////////////');
      }
      return right(products);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ProductItemModel>>> fetchGroceries() async {
    try {
      var response = await _fb.collection(productCollection).get();
      List<ProductItemModel> products = response.docs
          .map((element) => ProductItemModel.fromSnapShot(element))
          .toList();
      if (products == []) {
        debugPrint(
            '/////////////////////////////products is emprty //////////////////////////');
      }
      return right(products);
    } catch (e) {
      return left(e.toString());
    }
  }
}
