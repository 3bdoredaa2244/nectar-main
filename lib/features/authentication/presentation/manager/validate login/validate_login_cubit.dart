import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'validate_login_state.dart';

class ValidateLoginCubit extends Cubit<ValidateLoginState> {
  ValidateLoginCubit() : super(ValidateLoginInitial());

  bool isLogin = true;
  //AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  changeToLogin() {
    isLogin = true;
    emit(ValidateLoginChanged());
  }

  changeToReset() {
    isLogin = false;
    emit(ValidateLoginChanged());
  }
}
