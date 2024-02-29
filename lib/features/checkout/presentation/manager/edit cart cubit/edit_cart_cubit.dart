import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/cart_item_model.dart';
import '../../../../checkout/data/repos/cart repo/cart_repo.dart';

part 'edit_cart_state.dart';

class EditCartCubit extends Cubit<EditCartState> {
  EditCartCubit(this._cartRepo) : super(EditCartInitial());

  final CartRepo _cartRepo;
  editCart(
      {required CartItemModel cart,
      required String userId,
      num? count,
      num? totalPrice}) async {
    emit(EditCartLoading());
    final response = await _cartRepo.editCart(
        cart: cart, userId: userId, count: count, totalPrice: totalPrice);
    response.fold((failure) {
      emit(EditCartFailure(errorMessage: failure));
    }, (success) {
      emit(EditCartSuccess(cart: success));
    });
  }
}
