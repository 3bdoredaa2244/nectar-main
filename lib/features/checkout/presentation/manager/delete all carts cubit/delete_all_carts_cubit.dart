import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../checkout/data/repos/cart repo/cart_repo.dart';
part 'delete_all_carts_state.dart';

class DeleteAllCartsCubit extends Cubit<DeleteAllCartsState> {
  DeleteAllCartsCubit(this._cartRepo) : super(DeleteAllCartsInitial());

  final CartRepo _cartRepo;
  deleteAllCarts({required userId}) async {
    emit(DeleteAllCartsLoading());
    final response = await _cartRepo.deleteAllCarts(userId);
    response.fold((failure) {
      emit(DeleteAllCartsFailure(errorMessage: failure));
    }, (success) {
      emit(DeleteAllCartsSuccess());
    });
  }
}
