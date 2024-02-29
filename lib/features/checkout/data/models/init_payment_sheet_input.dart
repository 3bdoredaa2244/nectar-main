class InitPaymentSheetInputModel {
  final String paymentKeySecret;
  final String customerId;
  final String ephemeralKeySecret;
  final String merchantName;

  InitPaymentSheetInputModel(
      {required this.paymentKeySecret,
      required this.customerId,
      required this.ephemeralKeySecret,
      required this.merchantName});
}
