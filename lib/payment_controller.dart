import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class PaymentController{
  Map<String, dynamic>? paymentIntentData;

  Future<void> makePayment({required String amount, required String currency}) async{
    try{
      paymentIntentData = await createPaymentIntent(amount, currency);
      if(paymentIntentData != null){
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              billingDetails: const BillingDetails(
                name: 'Siam Prodhan',
                email: 'siamjht@gmail.com',
                phone: '01712345678',
                address: Address(
                    city: 'New York City',
                    country: 'United States',
                    line1: 'New York City',
                    line2: 'New York City',
                    postalCode: '12345',
                    state: 'New York City')
              ),
              // googlePay: const PaymentSheetGooglePay(merchantCountryCode: 'US'),
              merchantDisplayName: 'Prospects',
              paymentIntentClientSecret: paymentIntentData!['client_secret'],
              style: ThemeMode.dark,
            )).then((value) {print('Is completed payment properly????????????????');});
        displayPaymentSheet();
        print("----------display payment sheet didn't called");
      }
    } catch(e, s){
      Fluttertoast.showToast(msg: e.toString());
      print('-=-=-=-=-=-=-=---=-=-=-exception: $e $s =-=-=-=-=--=-=-=-=-=-=-=');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try{
      Map<String, dynamic> body = {
        'amount' : calculateAmount(amount),
        'currency' : currency,
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        body: body,
        headers: {
          'Authorization' : 'Bearer sk_test_51NsL1qAGQlA3WKiItI5TaZRQlYgxUxxJatB27Dqp9MeBJQo1AH7LrQ1VK2FSYLfgLPXFKOpp3no9ii8XEgSbfgPV008CBSw9Z8',
          'Content-Type' : 'application/x-www-form-urlencoded'
        }
      );
      print("=============>>>${response.body}----${response.statusCode}<<<==================");
      return jsonDecode(response.body);
    } catch (e){
      print("Error Occurred:======================> ${e.toString()}");
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }

  Future<void> displayPaymentSheet() async {
    try{
      final paymentResult = await Stripe.instance.presentPaymentSheet();
      print("^^^^^^^^^^^${paymentResult.toString()}");
      print('------------------Payment Successful----------------------------');
    } on Exception catch(e){
      if(e is StripeException){
        print("______________Error from Stripe: ${e.error.localizedMessage}_____________");
      } else {
        print("=============>>>>++++++++++++++  Unforeseen error: ${e}");
      }
    } catch(e){
      print("++++++++++++++++>>>> exception: $e <<<<++++++++++++++++++");
    }
  }
}