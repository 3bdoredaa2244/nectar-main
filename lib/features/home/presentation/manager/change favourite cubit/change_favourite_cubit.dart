import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/utils/constants.dart';

part 'change_favourite_state.dart';

class ChangeFavouriteCubit extends Cubit<ChangeFavouriteState> {
  ChangeFavouriteCubit() : super(ChangeFavouriteInitial());
  bool isFavorite = false;
  void fetchFavoriteProducts({required String productId}) async {
    // Retrieve the user's ID from Firebase Authentication
    try {
      emit(ChangeFavouriteLoading());
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Query the "favorites" collection in Firestore
        final QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection(favoriteCollection)
            .where('userId', isEqualTo: user.uid)
            .get();

        // Check if the current product is a favorite
        isFavorite = snapshot.docs.any((doc) => doc['productId'] == productId);
        emit(ChangeFavouriteSuccess());
      }
    } catch (e) {
      emit(ChangeFavouriteFailure(errorMessage: e.toString()));
    }
  }
}
