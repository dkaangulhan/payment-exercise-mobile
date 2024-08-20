import 'package:payment_exercise/services/payment/models/payment_init_params.dart';
import 'package:payment_exercise/services/payment/non_threeds/inon_threeds_service.dart';

/// Repository for non 3DS payment
class NonThreedsRepo {
  /// Constructor
  NonThreedsRepo(this.iNonThreedsService);

  // ignore: public_member_api_docs
  final INonThreedsService iNonThreedsService;

  /// Pay
  Future<void> pay(PaymentInitParams params, String token) async {
    return iNonThreedsService.pay(params, token);
  }
}
