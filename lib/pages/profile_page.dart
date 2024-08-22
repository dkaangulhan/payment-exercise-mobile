import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exercise/common/getit.dart';
import 'package:payment_exercise/global_stores/session_store.dart';
import 'package:payment_exercise/repos/session_repo.dart';
import 'package:payment_exercise/use_cases/auth/logout_use_case.dart';

/// Page for the profile.
class ProfilePage extends StatelessWidget {
  /// Page for the profile.
  const ProfilePage({super.key});

  /// Logout.
  Future<void> logout(BuildContext context) async {
    await LogoutUseCase(
      getit<SessionRepo>(),
      getit<SessionStore>(),
    ).execute();

    context.go('/profile');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              context.go('/profile/edit');
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                await logout(context);
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
