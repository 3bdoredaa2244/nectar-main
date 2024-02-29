import 'package:cloud_firestore/cloud_firestore.dart';

class CartItemModel {
  String? id;
  final String userId;
  final String productId;
  final num price;
  final String imageUrl;
  final String title;
  final num size;
  final String type;
  num? count;
  num? totalPrice;
  CartItemModel(
      {this.id,
      required this.userId,
      required this.productId,
      required this.price,
      required this.imageUrl,
      required this.title,
      required this.size,
      required this.type,
      this.count,
      this.totalPrice});

  toJson() => {
        "userId": userId,
        "productId": productId,
        "price": price,
        "imageUrl": imageUrl,
        "title": title,
        "type": type,
        "size": size,
        "count": count,
        "totalPrice": totalPrice,
      };
  factory CartItemModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return CartItemModel(
        id: document.id,
        userId: data['userId'],
        productId: data['productId'],
        price: data['price'],
        imageUrl: data['imageUrl'],
        title: data['title'],
        size: data['size'],
        type: data['type'],
        count: data['count'],
        totalPrice: data['totalPrice']);
  }
}
