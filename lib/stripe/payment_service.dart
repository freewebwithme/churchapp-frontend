import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stripe_payment/stripe_payment.dart';

class StripeTransactionResponse {
  String message;
  bool success;
  dynamic paymentMethod;
  StripeTransactionResponse({this.message, this.success, this.paymentMethod});
}

class StripeService {
  static String secret = DotEnv().env["STRIPE_SECRET"];
  static String publishableKey = DotEnv().env["STRIPE_PUBLISHABLE_KEY"];
  static String churchName = DotEnv().env["CHURCH_NAME"];

  static init() {
    StripePayment.setOptions(StripeOptions(
      publishableKey: publishableKey,
      merchantId: churchName,
    ));
  }

  static Future<StripeTransactionResponse> createPaymentMethod(
      String cardNumber,
      int expMonth,
      int expYear,
      String cvc,
      String amount) async {
    print("Calling from createPaymentMethod");
    var cardInfo = new Map();
    cardInfo['number'] = cardNumber;
    cardInfo['expMonth'] = expMonth;
    cardInfo['expYear'] = expYear;
    cardInfo['cvc'] = cvc;
    var card = CreditCard.fromJson(cardInfo);

    var pmRequest = PaymentMethodRequest(card: card);
    try {
      var paymentMethod = await StripePayment.createPaymentMethod(pmRequest);
      print("paymentMethod success");
      return new StripeTransactionResponse(
        message: "\$$amount 을 결제 하시겠습니까?",
        success: true,
        paymentMethod: paymentMethod,
      );
    } on PlatformException catch (err) {
      print("paymentMethod platformexception error");
      return StripeService.getPlatformExceptionErrorResult(err);
    } catch (err) {
      print("paymentMethod error");
      return new StripeTransactionResponse(
          message: "결제를 진행할 수 없습니다. 다시 시도하세요.",
          success: false,
          paymentMethod: null);
    }
  }

  static getPlatformExceptionErrorResult(err) {
    String message = "결제를 진행할 수 없습니다. 다시 시도하세요.";
    if (err.code == 'cancelled') {
      message = "결제를 취소 하셨습니다.";
    }

    return new StripeTransactionResponse(
        message: message, success: false, paymentMethod: null);
  }
}
