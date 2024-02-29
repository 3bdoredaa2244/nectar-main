import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_favorites_state.dart';

class GetFavoritesCubit extends Cubit<GetFavoritesState> {
  GetFavoritesCubit() : super(GetFavoritesInitial());
  void fetchFavoriteProducts({required String user}) async {
    try {
      emit(GetFavoritesLoading());
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('favorites')
          .where('userId', isEqualTo: user)
          .get();

      final List<String> favoriteProductIds =
          snapshot.docs.map((doc) => doc['productId'] as String).toList();
      if (favoriteProductIds.isEmpty) {
        emit(GetFavoritesEmpty());
      } else {
        emit(GetFavoritesSuccess(productsIdList: favoriteProductIds));
      }
    } catch (e) {
      emit(GetFavoritesFailure(errorMessage: e.toString()));
    }
  }
}
