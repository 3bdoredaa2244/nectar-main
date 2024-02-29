import '../models/cart_item_model.dart';

int currentIndex = 0;
const String productCollection = 'product';
const String favoriteCollection = 'favorites';
const String cartCollection = 'carts';
const String kUserBox = 'note_box';
late String myuserId;
late String myCustomerId;
List<CartItemModel>? gCarts;
