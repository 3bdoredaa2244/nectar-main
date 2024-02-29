import 'package:dartz/dartz.dart';
import 'package:nectar/features/checkout/data/models/customer%20model/customer_model/customer_model.dart';
import '../../../../core/errors/failures.dart';
import '../models/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, CustomerModel>> getCustomerId();
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
