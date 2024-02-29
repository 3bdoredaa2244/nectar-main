import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/models/cart_item_model.dart';
import '../../../../checkout/data/repos/cart repo/cart_repo.dart';

part 'get_total_price_state.dart';

class GetTotalPriceCubit extends Cubit<GetTotalPriceState> {
  GetTotalPriceCubit(this.cartRepo) : super(GetTotalPriceInitial());
  final CartRepo cartRepo;
  getTotalPrice({required String userId}) async {
    emit(GetTotalPriceLoading());
    final response = await cartRepo.getCarts(userId);
    response.fold((failure) {
      emit(GetTotalPriceFailure(errorMessage: failure));
    }, (success) {
      emit(GetTotalPriceSuccess(carts: success));
    });
  }
}
