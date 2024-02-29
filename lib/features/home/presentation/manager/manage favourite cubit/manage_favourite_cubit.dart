import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/core/utils/constants.dart';
part 'manage_favourite_state.dart';

class ManageFavouriteCubit extends Cubit<ManageFavouriteState> {
  ManageFavouriteCubit() : super(ManageFavouriteInitial());
  static ManageFavouriteCubit get(context) => BlocProvider.of(context);
  bool? isFavorite;
  _changeFavourite() {
    isFavorite = !isFavorite!;
    emit(ManageFavouriteChanged());
  }

  void toggleFavoriteStatus({required String productId}) async {
    // Retrieve the user's ID from Firebase Authentication
    try {
      ManageFavouriteLoading();
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Check if the product is already a favorite
        if (isFavorite == true) {
          // Remove the product from the user's favorites in Firestore
          final QuerySnapshot snapshot = await FirebaseFirestore.instance
              .collection(favoriteCollection)
              .where('userId', isEqualTo: user.uid)
              .where('productId', isEqualTo: productId)
              .get();

          final docId = snapshot.docs.first.id;
          await FirebaseFirestore.instance
              .collection(favoriteCollection)
              .doc(docId)
              .delete();
        } else {
          // Add the product to the user's favorites in Firestore
          await FirebaseFirestore.instance.collection('favorites').add({
            'userId': user.uid,
            'productId': productId,
          });
        }
        // Update the favorite status and icon color
        _changeFavourite();
        emit(ManageFavouriteSuccess());
      }
    } catch (e) {
      emit(ManageFavouriteFailure(errorMessage: e.toString()));
    }
  }
}
