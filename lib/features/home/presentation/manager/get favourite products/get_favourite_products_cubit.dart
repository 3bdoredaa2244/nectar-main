import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/models/product_item_model.dart';
import '../../../data/repos/shop_repo.dart';
part 'get_favourite_products_state.dart';

class GetFavouriteProductsCubit extends Cubit<GetFavouriteProductsState> {
  GetFavouriteProductsCubit(this.shopRepo)
      : super(GetFavouriteProductsInitial());

  final ShopRepo shopRepo;

  getFavoriteProducts(List<String> favoriteIds) async {
    emit(GetFavouriteProductsLoading());
    var response = await shopRepo.fetchFavoriteProducts(favoriteIds);
    response.fold((failure) {
      emit(GetFavouriteProductsFailure(errorMessage: failure));
    }, (products) {
      emit(GetFavouriteProductsSuccess(products: products));
    });
  }
}
