
import 'package:flutter/material.dart';
import 'package:flutter_stripe_test/payment_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var controller = PaymentController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              controller.makePayment(amount: '5', currency: 'USD');
            },
            child: Text('Make a payment')),
      ),
    );
  }
}
