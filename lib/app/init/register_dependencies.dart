import 'package:payment_exercise/common/getit.dart';
import 'package:payment_exercise/global_stores/cart_store.dart';
import 'package:payment_exercise/global_stores/product_store.dart';
import 'package:payment_exercise/global_stores/session_store.dart';
import 'package:payment_exercise/repos/auth_repo.dart';
import 'package:payment_exercise/repos/cart_repo.dart';
import 'package:payment_exercise/repos/payment/non_threeds_repo.dart';
import 'package:payment_exercise/repos/payment/threeds_repo.dart';
import 'package:payment_exercise/repos/product_repo.dart';
import 'package:payment_exercise/repos/profile_repo.dart';
import 'package:payment_exercise/repos/session_repo.dart';
import 'package:payment_exercise/services/auth/auth_service.dart';
import 'package:payment_exercise/services/cart/cart_service.dart';
import 'package:payment_exercise/services/payment/non_threeds/non_threeds_service.dart';
import 'package:payment_exercise/services/payment/threeds/threeds_service.dart';
import 'package:payment_exercise/services/product/product_service.dart';
import 'package:payment_exercise/services/profile/profile_service.dart';
import 'package:payment_exercise/services/session/session_service.dart';

/// Use this class to register all dependencies.
class RegisterDependencies {
  /// Register all dependencies.
  static void init() {
    /// Repos
    getit
      ..registerSingleton<AuthRepo>(
        AuthRepo(AuthService()),
      )
      ..registerSingleton<ProfileRepo>(
        ProfileRepo(ProfileService()),
      )
      ..registerSingleton<ProductRepo>(
        ProductRepo(
          ProductService(),
        ),
      )
      ..registerSingleton<SessionRepo>(
        SessionRepo(SessionService()),
      )
      ..registerSingleton<CartRepo>(
        CartRepo(
          CartService(),
        ),
      )
      ..registerSingleton<NonThreedsRepo>(
        NonThreedsRepo(NonThreedsService()),
      )
      ..registerSingleton<ThreedsRepo>(
        ThreedsRepo(ThreedsService()),
      );

    /// Stores
    // ignore: cascade_invocations
    getit
      ..registerSingleton<SessionStore>(
        SessionStore(),
      )
      ..registerSingleton<ProductStore>(
        ProductStore(),
      )
      ..registerSingleton<CartStore>(
        CartStore(),
      );
  }
}
