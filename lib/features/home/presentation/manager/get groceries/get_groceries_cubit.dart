import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/models/product_item_model.dart';
import '../../../data/repos/shop_repo.dart';
part 'get_groceries_state.dart';

class GetGroceriesCubit extends Cubit<GetGroceriesState> {
  GetGroceriesCubit(this.shopRepo) : super(GetGroceriesInitial());
  final ShopRepo shopRepo;
  getGroceries() async {
    emit(GetGroceriesLoading());
    var responce = await shopRepo.fetchGroceries();
    responce.fold((failure) {
      emit(GetGroceriesFailure(errorMessage: failure));
    }, (products) {
      emit(GetGroceriesSuccess(products: products));
    });
  }
}
