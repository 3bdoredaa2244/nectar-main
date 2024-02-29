import 'package:dartz/dartz.dart';
import 'package:nectar/core/models/product_item_model.dart';

abstract class ProductCategoryRepo {
  Future<Either<String, List<ProductItemModel>>> fetchProductCategory(
      {required String category});
}
