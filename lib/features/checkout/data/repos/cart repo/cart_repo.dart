import 'package:dartz/dartz.dart';
import 'package:nectar/core/models/cart_item_model.dart';

abstract class CartRepo {
  Future<Either<String, void>> addCart(CartItemModel cartItem);
  Future<Either<String, List<CartItemModel>>> getCarts(String userId);
  Future<Either<String, List<CartItemModel>>> getTotalPrice(String userId);
  Future<Either<String, CartItemModel>> editCart(
      {required CartItemModel cart,
      required String userId,
      num? count,
      num? totalPrice});
  Future<Either<String, void>> deleteCart(
      {required CartItemModel cart, required String userId});
  Future<Either<String, void>> deleteAllCarts(String userId);
}
