import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:payment_exercise/common/getit.dart';
import 'package:payment_exercise/global_stores/session_store.dart';
import 'package:payment_exercise/pages/threeds_page.dart';
import 'package:payment_exercise/repos/payment/non_threeds_repo.dart';
import 'package:payment_exercise/services/payment/models/payment_init_params.dart';
import 'package:payment_exercise/use_cases/payment/threeds/initialize_threeds_use_case.dart';

/// Checkout page.
class CheckoutPage extends StatefulWidget {
  /// Checkout page.
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool useThreeds = false;

  final cardNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final cardHolderNameController = TextEditingController();
  final cvvCodeController = TextEditingController();

  bool isCvvFocused = false;
  FocusNode cvvFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    cardNumberController.addListener(() {
      setState(() {});
    });
    expiryDateController.addListener(() {
      setState(() {});
    });
    cardHolderNameController.addListener(() {
      setState(() {});
    });
    cvvCodeController.addListener(() {
      setState(() {});
    });

    cvvFocusNode.addListener(() {
      setState(() {
        isCvvFocused = cvvFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    expiryDateController.dispose();
    cardHolderNameController.dispose();
    cvvCodeController.dispose();
    cvvFocusNode.dispose();
    super.dispose();
  }

  Future<void> pay() async {
    if (useThreeds) {
      await threedsPayment();
    } else {
      await nonThreedsPayment();
    }
  }

  Future<void> nonThreedsPayment() async {
    final token = getit.get<SessionStore>().userSession.token!;
    try {
      await getit<NonThreedsRepo>().pay(
        PaymentInitParams(
          cardHolderName: cardHolderNameController.text,
          cardNumber: cardNumberController.text,
          expireMonth: '12',
          expireYear: '2030',
          cvc: cvvCodeController.text,
          registerCard: '0',
        ),
        token,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.greenAccent,
          content: Text('Payment successful'),
        ),
      );
    } catch (e, st) {
      print('Error: $e, StackTrace: $st');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text('Payment failed'),
        ),
      );
    }
  }

  Future<void> threedsPayment() async {
    final token = getit.get<SessionStore>().userSession.token!;
    final response = await InitializeThreedsUseCase(getit()).execute(
      PaymentInitParams(
        cardHolderName: cardHolderNameController.text,
        cardNumber: cardNumberController.text,
        expireMonth: '12',
        expireYear: '2030',
        cvc: cvvCodeController.text,
        registerCard: '0',
      ),
      token,
    );

    print('3DS response: $response');

    if (response.status == 'success') {
      // Process payment

      final decodedString = utf8.decode(
        base64Decode(response.threeDSHtmlContent!),
      );

      await Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (context) {
            return ThreedsPage(
              htmlString: decodedString,
            );
          },
        ),
      );
    } else {
      // Payment failed
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text('Payment failed'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          CreditCardWidget(
            padding: 0,
            cardNumber: cardNumberController.text,
            expiryDate: expiryDateController.text,
            cardHolderName: cardHolderNameController.text,
            cvvCode: cvvCodeController.text,
            showBackView: isCvvFocused,
            onCreditCardWidgetChange: (CreditCardBrand brand) {},
            isHolderNameVisible: true,
          ),
          TextField(
            controller: cardNumberController,
            maxLength: 16,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Card Number',
            ),
          ),
          TextField(
            controller: cardHolderNameController,
            decoration: const InputDecoration(
              labelText: 'Card Holder Name',
            ),
          ),
          TextField(
            controller: expiryDateController,
            decoration: const InputDecoration(
              labelText: 'Expiry Date',
            ),
          ),
          TextField(
            controller: cvvCodeController,
            focusNode: cvvFocusNode,
            maxLength: 3,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'CVV',
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const Text('Use 3DS'),
              Switch(
                value: useThreeds,
                onChanged: (value) {
                  setState(() {
                    useThreeds = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: pay,
            child: const Text('Pay'),
          ),
        ],
      ),
    );
  }
}
