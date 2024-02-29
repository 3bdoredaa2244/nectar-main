import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nectar/features/checkout/data/models/customer%20model/customer_model/customer_model.dart';

import '../../../../core/payment/payment_manager.dart';
import '../../../../core/errors/failures.dart';
import '../models/payment_intent_input_model.dart';
import 'checkout_repo.dart';

class CheckoutRepoImp extends CheckoutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailures.fromDioError(e),
        );
      }
      return left(
        ServerFailures(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, CustomerModel>> getCustomerId() async {
    try {
      var responce = await stripeService.getCustomer();
      return right(responce);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioError(e));
      } else {
        return left(ServerFailures(e.toString()));
      }
    }
  }
}
