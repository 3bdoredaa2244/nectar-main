import 'item.dart';

class ItemsListModel {
  List<OrderItemModel>? orders;

  ItemsListModel({this.orders});

  factory ItemsListModel.fromJson(Map<String, dynamic> json) {
    return ItemsListModel(
      orders: (json['items'] as List<dynamic>?)
          ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'items': orders?.map((e) => e.toJson()).toList(),
      };
}
