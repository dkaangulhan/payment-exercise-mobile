import 'package:payment_exercise/services/payment/models/payment_init_params.dart';
import 'package:payment_exercise/services/payment/threeds/models/threeds_response_model.dart';

/// Interface for 3DS service
abstract class IThreedsService {
  /// Initializes 3DS
  Future<ThreedsResponseModel> initialize(
    PaymentInitParams params,
    String token,
  );
}
