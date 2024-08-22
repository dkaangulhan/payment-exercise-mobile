import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exercise/common/getit.dart';
import 'package:payment_exercise/global_stores/session_store.dart';
import 'package:payment_exercise/models/product_model.dart';
import 'package:payment_exercise/pages/auth/login_page.dart';
import 'package:payment_exercise/pages/auth/register_page.dart';
import 'package:payment_exercise/pages/checkout_page.dart';
import 'package:payment_exercise/pages/home_page.dart';
import 'package:payment_exercise/pages/product_details_page.dart';
import 'package:payment_exercise/pages/profile/edit_profile_address_page.dart';
import 'package:payment_exercise/pages/profile/edit_profile_page.dart';
import 'package:payment_exercise/pages/profile_page.dart';
import 'package:payment_exercise/pages/shopping_cart_page.dart';

/// Class
class AppRouter {
  /// The router of the application.
  static GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/product',
        builder: (context, state) {
          final product = state.extra as ProductModel?;

          return ProductDetailsPage(product: product);
        },
      ),
      GoRoute(
        path: '/checkout',
        redirect: (context, state) {
          final isLoggedIn = getit<SessionStore>().isLoggedIn;
          return isLoggedIn ? null : '/auth/login';
        },
        builder: (context, state) {
          return const CheckoutPage();
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: navigationShell.currentIndex,
              onTap: (index) {
                navigationShell.goBranch(index, initialLocation: true);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
            body: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/',
                builder: (context, state) {
                  return const HomePage();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            initialLocation: '/auth/login',
            routes: [
              GoRoute(
                path: '/profile',
                redirect: (context, state) {
                  final isLoggedIn = getit<SessionStore>().isLoggedIn;
                  return isLoggedIn ? null : '/auth/login';
                },
                builder: (context, state) {
                  return const ProfilePage();
                },
                routes: [
                  GoRoute(
                    path: 'edit',
                    builder: (context, state) {
                      return const EditProfilePage();
                    },
                    routes: [
                      GoRoute(
                        path: 'address',
                        builder: (context, state) {
                          final user = getit<SessionStore>().user!;
                          return EditProfileAdressPage(
                            user: user,
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'cart',
                    builder: (context, state) {
                      return const ShoppingCartPage();
                    },
                  ),
                ],
              ),
              GoRoute(
                path: '/auth/login',
                redirect: (context, state) {
                  final isLoggedIn = getit<SessionStore>().isLoggedIn;
                  return isLoggedIn ? '/profile' : null;
                },
                builder: (context, state) {
                  return const LoginPage();
                },
              ),
              GoRoute(
                path: '/auth/register',
                redirect: (context, state) {
                  final isLoggedIn = getit<SessionStore>().isLoggedIn;
                  return isLoggedIn ? '/profile' : null;
                },
                builder: (context, state) {
                  return const RegisterPage();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
