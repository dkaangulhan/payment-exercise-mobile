import 'package:payment_exercise/services/payment/models/payment_init_params.dart';

/// Abstract class for non 3DS services
abstract class INonThreedsService {
  /// Pay
  Future<void> pay(PaymentInitParams params, String token);
}
