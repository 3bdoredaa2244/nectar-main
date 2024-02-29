import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nectar/core/utils/constants.dart';
import 'package:nectar/features/profile/data/models/user%20details%20model/user_details.dart';
import 'package:nectar/features/profile/data/repos/account%20repo/account_repo.dart';

class AccountRepoImp implements AccountRepo {
  @override
  Future<Either<String, void>> addUserDetails(UserDetailsModel user) async {
    try {
      var userBox = Hive.box<UserDetailsModel>(kUserBox);
      await userBox.put(user.id, user);
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Either<String, UserDetailsModel> fetchUserDetails(String userId) {
    try {
      var userBox = Hive.box<UserDetailsModel>(kUserBox);
      UserDetailsModel? userDetails = userBox.get(userId);
      return right(userDetails!);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> updateUserDetails(
      UserDetailsModel user, String userId) async {
    try {
      var userBox = Hive.box<UserDetailsModel>(kUserBox);
      await userBox.put(userId, user);
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }
}
