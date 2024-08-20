import 'package:payment_exercise/services/payment/models/payment_init_params.dart';
import 'package:payment_exercise/services/payment/threeds/ithreeds_service.dart';
import 'package:payment_exercise/services/payment/threeds/models/threeds_response_model.dart';

/// Repository for 3DS service operations
class ThreedsRepo {
  /// Repository for 3DS service operations
  ThreedsRepo(this.iThreedsService);

  /// 3DS service
  final IThreedsService iThreedsService;

  /// Initializes 3DS
  Future<ThreedsResponseModel> initialize(
    PaymentInitParams params,
    String token,
  ) async {
    return iThreedsService.initialize(
      params,
      token,
    );
  }
}
