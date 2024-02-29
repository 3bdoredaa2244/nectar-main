import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/models/cart_item_model.dart';
import '../../../../checkout/data/repos/cart repo/cart_repo.dart';
part 'get_carts_state.dart';

class GetCartsCubit extends Cubit<GetCartsState> {
  GetCartsCubit(this._cartRepo) : super(GetCartsInitial());

  final CartRepo _cartRepo;
  getCarts({required String userId}) async {
    emit(GetCartsLoading());
    final response = await _cartRepo.getCarts(userId);
    response.fold((failure) {
      emit(GetCartsFailure(errorMessage: failure));
    }, (success) {
      emit(GetCartsSuccess(carts: success));
    });
  }
}
