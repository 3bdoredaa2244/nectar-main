import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nectar/core/models/cart_item_model.dart';
import 'package:nectar/features/checkout/data/repos/cart%20repo/cart_repo.dart';
part 'add_cart_state.dart';

class AddCartCubit extends Cubit<AddCartState> {
  AddCartCubit(this._cartRepo) : super(AddCartInitial());
  final CartRepo _cartRepo;
  addCart(CartItemModel cart) async {
    emit(AddCartLoading());
    final response = await _cartRepo.addCart(cart);
    response.fold((failure) {
      emit(AddCartFailure(errorMessage: failure));
    }, (success) {
      emit(AddCartSuccess());
    });
  }
}
