class CustomerModel {
  String? id;

  CustomerModel({
    this.id,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}
