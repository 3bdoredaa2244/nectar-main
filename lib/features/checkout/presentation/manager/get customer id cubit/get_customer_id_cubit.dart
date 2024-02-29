import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/models/customer model/customer_model/customer_model.dart';
import '../../../data/repos/checkout_repo.dart';
part 'get_customer_id_state.dart';

class GetCustomerIdCubit extends Cubit<GetCustomerIdState> {
  GetCustomerIdCubit(this.checkoutRepo) : super(GetCustomerIdInitial());
  final CheckoutRepo checkoutRepo;
  getCustomerId() async {
    emit(GetCustomerIdLoading());
    var data = await checkoutRepo.getCustomerId();
    data.fold((failure) {
      emit(GetCustomerIdFailure(errorMessage: failure.errorMessage));
    }, (success) {
      emit(GetCustomerIdSuccess(customer: success));
    });
  }
}
