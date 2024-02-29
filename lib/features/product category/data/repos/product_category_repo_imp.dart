import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:nectar/core/models/product_item_model.dart';
import 'package:nectar/core/utils/constants.dart';
import 'product_category_repo.dart';

class ProductCategoryRepoImp implements ProductCategoryRepo {
  final FirebaseFirestore _fb = FirebaseFirestore.instance;
  @override
  Future<Either<String, List<ProductItemModel>>> fetchProductCategory(
      {required String category}) async {
    try {
      final querySnapshot = await _fb
          .collection(productCollection)
          .where("category", isEqualTo: category)
          .get();
      final producItems = querySnapshot.docs
          .map((item) => ProductItemModel.fromSnapShot(item))
          .toList();
      return right(producItems);
    } catch (e) {
      return left(e.toString());
    }
  }
}
