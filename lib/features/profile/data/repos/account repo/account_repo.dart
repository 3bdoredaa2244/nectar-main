import 'package:dartz/dartz.dart';
import 'package:nectar/features/profile/data/models/user%20details%20model/user_details.dart';

abstract class AccountRepo {
  Future<Either<String, void>> addUserDetails(UserDetailsModel user);
  Either<String, UserDetailsModel> fetchUserDetails(String userId);
  Future<Either<String, void>> updateUserDetails(
      UserDetailsModel user, String userId);
}
