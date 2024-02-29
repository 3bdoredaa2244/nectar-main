import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:nectar/core/models/cart_item_model.dart';
import 'package:nectar/features/checkout/data/repos/cart%20repo/cart_repo.dart';
import '../../../../../core/utils/constants.dart';

class CartRepoImp implements CartRepo {
  final FirebaseFirestore _fb = FirebaseFirestore.instance;
  final CollectionReference _cartCollection =
      FirebaseFirestore.instance.collection(cartCollection);

  @override
  Future<Either<String, void>> addCart(CartItemModel cartItem) async {
    try {
      await _cartCollection.add(cartItem.toJson());
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> deleteAllCarts(String userId) async {
    try {
      final querySnapshot = await _fb
          .collection(cartCollection)
          .where('userId', isEqualTo: userId)
          .get();
      final cartItems = querySnapshot.docs
          .map((doc) => CartItemModel.fromSnapShot(doc))
          .toList();

      for (final cartItem in cartItems) {
        await _cartCollection.doc(cartItem.id!).delete();
      }
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> deleteCart(
      {required CartItemModel cart, required String userId}) async {
    try {
      final querySnapshot = await _fb
          .collection(cartCollection)
          .where("userId", isEqualTo: userId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        //final documentId = querySnapshot.docs.first.id;
        await _fb.collection(cartCollection).doc(cart.id).delete();
        return right(null); // Successful deletion, returning void
      } else {
        // Handle the case where the document with the specified userId is not found
        return left('Document not found');
      }
    } catch (e) {
      return left(e.toString()); // Return the error message as a String
    }
  }

  @override
  Future<Either<String, CartItemModel>> editCart(
      {required CartItemModel cart,
      required String userId,
      num? count,
      num? totalPrice}) async {
    try {
      final querySnapshot = await _fb
          .collection(cartCollection)
          .where("userId", isEqualTo: userId)
          .get();
      final cartItems = querySnapshot.docs
          .map((doc) => CartItemModel.fromSnapShot(doc))
          .toList();

      final updatedCartItemIndex =
          cartItems.indexWhere((item) => item.id == cart.id);
      if (updatedCartItemIndex != -1) {
        final updatedCartItem = cartItems[updatedCartItemIndex];
        // Update the specific fields for the cart item
        if (count != null) {
          updatedCartItem.count = count;
        }
        if (totalPrice != null) {
          updatedCartItem.totalPrice = totalPrice;
        }
        await _cartCollection.doc(cart.id).update(updatedCartItem.toJson());
        return right(updatedCartItem);
      } else {
        return left('Cart item not found');
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<CartItemModel>>> getCarts(String userId) async {
    try {
      final querySnapshot = await _fb
          .collection(cartCollection)
          .where("userId", isEqualTo: userId)
          .get();
      final cartItems = querySnapshot.docs
          .map((item) => CartItemModel.fromSnapShot(item))
          .toList();
      return right(cartItems);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<CartItemModel>>> getTotalPrice(String userId) {
    throw UnimplementedError();
  }
}
