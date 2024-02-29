import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nectar/core/utils/constants.dart';

part 'delete_favourite_state.dart';

class DeleteFavouriteCubit extends Cubit<DeleteFavouriteState> {
  DeleteFavouriteCubit() : super(DeleteFavouriteInitial());
  final _fb = FirebaseFirestore.instance.collection(favoriteCollection);
  deleteFavourite({required String userId, required String productId}) async {
    emit(DeleteFavouriteLoading());
    try {
      final QuerySnapshot snapshot = await _fb
          .where('userId', isEqualTo: userId)
          .where('productId', isEqualTo: productId)
          .get();
      List<QueryDocumentSnapshot> documents = snapshot.docs;
      if (documents.isNotEmpty) {
        final String documentId = documents.first.id;
        await _fb.doc(documentId).delete();
        emit(DeleteFavouriteSuccess());
      } else {
        emit(DeleteFavouriteFailure(errorMessage: 'favourite item not found'));
      }
    } catch (e) {
      emit(DeleteFavouriteFailure(errorMessage: e.toString()));
    }
  }
}
