import 'package:hive/hive.dart';
part 'user_details.g.dart';

@HiveType(typeId: 0)
class UserDetailsModel extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? email;

  @HiveField(3)
  String? phoneNumber;

  @HiveField(4)
  String? photo;

  @HiveField(5)
  String? customerId;

  @HiveField(6)
  String? token;

  UserDetailsModel(
      {this.id,
      this.name,
      this.email,
      this.phoneNumber,
      this.photo,
      this.customerId,
      this.token});
}
