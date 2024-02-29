import 'package:cloud_firestore/cloud_firestore.dart';

class ProductItemModel {
  final String? id;
  final String title;
  final String type; //
  final String category; //
  final String company; //
  final String? imageUrl; //
  final num rate; //
  final String? benefits; //
  final String? details; //
  final num price; //
  final num offerPrice; //
  final num? percent;
  final num size;

  ProductItemModel(
      {this.id,
      required this.title,
      required this.type,
      required this.category,
      required this.company,
      required this.imageUrl,
      required this.rate,
      this.benefits,
      this.details,
      required this.price,
      required this.offerPrice,
      this.percent,
      required this.size});
  toJson() => {
        "type": type,
        "category": category,
        "company": company,
        "imageUrl": imageUrl,
        "rate": rate as double,
        "benefits": benefits,
        "details": details,
        "price": price,
        "offerPrice": offerPrice,
        "title": title,
        "size": size
      };
  factory ProductItemModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ProductItemModel(
      id: document.id,
      title: data['title'],
      type: data['type'],
      category: data['category'],
      company: data['company'],
      imageUrl: data['imageUrl'],
      rate: data['rate'] as double,
      benefits: data['benefits'],
      details: data['details'],
      price: data['price'],
      offerPrice: data['offerPrice'],
      size: data['size'],
      percent: ((data['price'] - data['offerPrice']) / data['price'] * 100),
    );
  }
}
