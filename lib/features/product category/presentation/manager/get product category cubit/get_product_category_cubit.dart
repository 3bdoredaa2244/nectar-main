import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nectar/features/product%20category/data/repos/product_category_repo.dart';
import '../../../../../core/models/product_item_model.dart';
part 'get_product_category_state.dart';

class GetProductCategoryCubit extends Cubit<GetProductCategoryState> {
  GetProductCategoryCubit(this._productCategory)
      : super(GetProductCategoryInitial());
  final ProductCategoryRepo _productCategory;
  getProductCategory({required String category}) async {
    final responce =
        await _productCategory.fetchProductCategory(category: category);
    responce.fold((failure) {
      emit(GetProductCategoryFailure(errorMessage: failure));
    }, (success) {
      if (success.isEmpty) {
        emit(GetProductCategoryEmpty());
      } else {
        emit(GetProductCategorySuccess(products: success));
      }
    });
  }
}
