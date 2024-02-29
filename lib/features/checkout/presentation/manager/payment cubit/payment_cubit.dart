import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/models/payment_intent_input_model.dart';
import '../../../data/repos/checkout_repo.dart';
part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());
  final CheckoutRepo checkoutRepo;
  int activeIndex = 0;
  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());
    var data = await checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    data.fold((l) => emit(PaymentFailure(errorMessage: l.errorMessage)),
        (r) => emit(PaymentSuccess()));
  }

  bool checkIndex(int index) {
    return activeIndex == index;
  }

  void changeIndex(int index) {
    activeIndex = index;
    emit(PaymentIndex());
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
