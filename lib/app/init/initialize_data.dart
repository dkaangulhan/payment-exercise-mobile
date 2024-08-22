import 'dart:async';

import 'package:payment_exercise/common/getit.dart';
import 'package:payment_exercise/use_cases/product/get_all_products_use_case.dart';
import 'package:payment_exercise/use_cases/profile/load_session_use_case.dart';

/// This class is responsible for initializing required data.
class InitializeData {
  /// Gets required data.
  Future<void> init() async {
    await LoadSessionUseCase(getit(), getit()).execute();
    unawaited(GetAllProductsUseCase(getit(), getit()).execute());
  }
}
