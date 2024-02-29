import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/models/cart_item_model.dart';
part 'count_total_order_state.dart';

class CountTotalOrderCubit extends Cubit<CountTotalOrderState> {
  CountTotalOrderCubit() : super(CountTotalOrderInitial());

  List<CartItemModel>? cartItems = [];
  num generalTotalPrice = 0;
  countTotal() {
    if (cartItems != null && cartItems!.isNotEmpty) {
      for (var cartItem in cartItems!) {
        generalTotalPrice += cartItem.totalPrice ?? 0;
        emit(CountTotalOrderChanged());
      }
    } else {
      generalTotalPrice = 0;
      emit(CountTotalOrderChanged());
    }
  }
}
