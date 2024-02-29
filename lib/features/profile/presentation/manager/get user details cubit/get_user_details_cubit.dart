import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nectar/features/profile/data/repos/account%20repo/account_repo.dart';

import '../../../data/models/user details model/user_details.dart';

part 'get_user_details_state.dart';

class GetUserDetailsCubit extends Cubit<GetUserDetailsState> {
  GetUserDetailsCubit(this.accountRepo) : super(GetUserDetailsInitial());
  final AccountRepo accountRepo;
  getUserDetails(userId) async {
    emit(GetUserDetailsLoading());
    var responce = accountRepo.fetchUserDetails(userId);
    responce.fold((failure) {
      emit(GetUserDetailsFailure(errorMessage: failure));
    }, (user) {
      emit(GetUserDetailsSuccess(user: user));
    });
  }
}
