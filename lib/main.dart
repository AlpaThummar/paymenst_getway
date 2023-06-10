import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

void main() {
  runApp(MaterialApp(home: Payment_Getway(),));
}
class Payment_Getway extends StatefulWidget {
  const Payment_Getway({super.key});

  @override
  State<Payment_Getway> createState() => _Payment_GetwayState();
}

class _Payment_GetwayState extends State<Payment_Getway> {

 final _razorpay = Razorpay();
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

 void _handlePaymentSuccess(PaymentSuccessResponse response) {
   // Do something when payment succeeds
   print("Sucess:${response.orderId}");
   print("ID:${response.paymentId}");
   print("Sigb:${response.signature}");

 }

 void _handlePaymentError(PaymentFailureResponse response) {
   // Do something when payment fails
   print("Cosd:${response.code}");
   print("Eoore:${response.error}");
   print("Error Mesge:${response.message}");
 }

 void _handleExternalWallet(ExternalWalletResponse response) {
   // Do something when an external wallet was selected
   print(response.walletName);
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PaymenstGetway Demo"),),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {
            var options = {
              'key': 'rzp_test_Ed5M95oHIfuwwM',
              'amount': 100*100,
              'name': 'product1.',
              'description': 'Fine T-Shirt',
              'prefill': {
                'contact': '8888888888',
                'email': 'test@razorpay.com'
              }
            };

            _razorpay.open(options);

          }, child: Text("Pay 100")),

          ElevatedButton(onPressed: () {
            var options = {
              'key': 'rzp_test_Ed5M95oHIfuwwM',
              'amount': 2000*100,
              'name': 'product2',
              'description': 'Fine T-Shirt',
              'prefill': {
                'contact': '999999999',
                'email': 'test@razorpay.com'
              }
            };

            _razorpay.open(options);

          }, child: Text("Pay 2000")),
        ],
      ),

    );
  }
}

