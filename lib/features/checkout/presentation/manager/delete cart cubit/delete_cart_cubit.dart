import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nectar/core/models/cart_item_model.dart';
import '../../../../checkout/data/repos/cart repo/cart_repo.dart';
part 'delete_cart_state.dart';

class DeleteCartCubit extends Cubit<DeleteCartState> {
  DeleteCartCubit(this._cartRepo) : super(DeleteCartInitial());
  final CartRepo _cartRepo;
  deleteCart({required CartItemModel cart, required String userId}) async {
    emit(DeleteCartLoading());
    final response = await _cartRepo.deleteCart(cart: cart, userId: userId);
    response.fold((failure) {
      emit(DeleteCartFailure(errorMessage: failure));
    }, (success) {
      emit(DeleteCartSuccess());
    });
  }
}
