import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nectar/features/profile/data/models/user%20details%20model/user_details.dart';
import 'package:nectar/features/profile/data/repos/account%20repo/account_repo.dart';

part 'add_user_details_state.dart';

class AddUserDetailsCubit extends Cubit<AddUserDetailsState> {
  AddUserDetailsCubit(this.accountRepo) : super(AddUserDetailsInitial());
  final AccountRepo accountRepo;
  addUser(UserDetailsModel user) async {
    emit(AddUserDetailsLoading());
    var responce = await accountRepo.addUserDetails(user);
    responce.fold((failure) {
      emit(AddUserDetailsFailure(errorMessage: failure));
    }, (user) {
      emit(AddUserDetailsSuccess());
    });
  }
}
