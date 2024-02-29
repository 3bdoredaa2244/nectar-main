import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:nectar/core/payment/stripe_keys.dart';
import 'package:nectar/features/checkout/data/models/customer%20model/customer_model/customer_model.dart';
import '../../features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import '../../features/checkout/data/models/init_payment_sheet_input.dart';
import '../../features/checkout/data/models/payment_intent_input_model.dart';
import '../../features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import '../utils/api_service.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<CustomerModel> getCustomer() async {
    var response = await apiService.postCustomerId(
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/customers');
    var customerModel = CustomerModel.fromJson(response.data);
    return customerModel;
  }

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
        body: paymentIntentInputModel.toJson(),
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/payment_intents');
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future<EphemeralKeyModel> createEphemeralKey(String customerId) async {
    var response = await apiService.post(
        body: {'customer': customerId},
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        headers: {
          'Authorization': "Bearer ${PaymentKeys.secretkey}",
          'Stripe-Version': '2023-08-16'
        });
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret:
                initPaymentSheetInputModel.paymentKeySecret,
            merchantDisplayName: initPaymentSheetInputModel.merchantName,
            customerId: initPaymentSheetInputModel.customerId,
            customerEphemeralKeySecret:
                initPaymentSheetInputModel.ephemeralKeySecret));
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralModel =
        await createEphemeralKey(paymentIntentInputModel.customerId);
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
        paymentKeySecret: paymentIntentModel.clientSecret!,
        customerId: paymentIntentInputModel.customerId,
        ephemeralKeySecret: ephemeralModel.secret!,
        merchantName: 'nader');
    await initPaymentSheet(
        initPaymentSheetInputModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }
}
