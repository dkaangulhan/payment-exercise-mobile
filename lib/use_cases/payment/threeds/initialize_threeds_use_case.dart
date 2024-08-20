import 'package:payment_exercise/repos/payment/threeds_repo.dart';
import 'package:payment_exercise/services/payment/models/payment_init_params.dart';
import 'package:payment_exercise/services/payment/threeds/models/threeds_response_model.dart';

/// Use case to initialize 3DS.
class InitializeThreedsUseCase {
  /// Use case to initialize 3DS.
  InitializeThreedsUseCase(this.threedsRepo);

  /// Repository for 3DS service operations
  final ThreedsRepo threedsRepo;

  /// Initializes 3DS
  Future<ThreedsResponseModel> execute(
    PaymentInitParams params,
    String token,
  ) async {
    return threedsRepo.initialize(
      params,
      token,
    );
  }
}
