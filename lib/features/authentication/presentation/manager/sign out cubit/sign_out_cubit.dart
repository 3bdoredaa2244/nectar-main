import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit() : super(SignOutInitial());

  signOut() async {
    try {
      emit(SignOutLoading());
      await FirebaseAuth.instance.signOut();
      emit(SignOutSuccess());
    } catch (e) {
      emit(SignOutFailure(errorMessage: e.toString()));
    }
  }
}
