import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  PhoneAuthCubit() : super(PhoneAuthInitial());
  FirebaseAuth auth = FirebaseAuth.instance;
  String phoneNumber = '';
  phoneAuth({required String sms}) async {
    emit(PhoneAuthLoading());
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+$phoneNumber',
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) {
          emit(PhoneAuthSuccess());
        },
        verificationFailed: (FirebaseAuthException e) {
          emit(PhoneAuthFailure(errorMessage: e.toString()));
        },
        codeSent: (String verificationId, int? resendToken) async {
          try {
            // Update the UI - wait for the user to enter the SMS code
            String smsCode = sms;

            // Create a PhoneAuthCredential with the code
            PhoneAuthCredential credential = PhoneAuthProvider.credential(
                verificationId: verificationId, smsCode: smsCode);

            // Sign the user in (or link) with the credential
            await auth.signInWithCredential(credential).then((value) {
              if (value.user != null) {
                emit(PhoneAuthSuccess());
              } else {
                emit(PhoneAuthFailure(errorMessage: 'user is null '));
              }
            });
          } catch (e) {
            emit(PhoneAuthFailure(errorMessage: e.toString()));
          }
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      emit(PhoneAuthFailure(errorMessage: e.toString()));
    }
  }
}
