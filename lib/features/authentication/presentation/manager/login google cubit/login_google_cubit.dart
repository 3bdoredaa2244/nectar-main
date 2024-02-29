import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'login_google_state.dart';

class LoginGoogleCubit extends Cubit<LoginGoogleState> {
  LoginGoogleCubit() : super(LoginGoogleInitial());

  Future signInWithGoogle() async {
    try {
      emit(LoginGoogleLoading());
      GoogleSignIn googleSignIn = GoogleSignIn();
      bool isSignedIn = await googleSignIn.isSignedIn();
      if (isSignedIn) {
        await googleSignIn.disconnect();
      }
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      debugPrint(
          '/////////////////////////////id//////////////////////////////////');
      debugPrint(googleUser?.id ?? 'id not found');
      // Obtain the auth details from the request
      if (googleUser != null) {
        try {
          final GoogleSignInAuthentication googleAuth =
              await googleUser.authentication;

          // Create a new credential
          AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
          // Once signed in, return the UserCredential
          UserCredential userCredential =
              await FirebaseAuth.instance.signInWithCredential(credential);
          User user = userCredential.user!;
          emit(LoginGoogleSuccess(user: user));
        } catch (e) {
          emit(LoginGoogleFailure(errorMessage: e.toString()));
        }
      }
    } catch (e) {
      emit(LoginGoogleFailure(errorMessage: e.toString()));
    }
  }
}
