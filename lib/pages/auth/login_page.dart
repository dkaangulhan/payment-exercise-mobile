import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exercise/common/getit.dart';
import 'package:payment_exercise/global_stores/session_store.dart';
import 'package:payment_exercise/repos/auth_repo.dart';
import 'package:payment_exercise/repos/profile_repo.dart';
import 'package:payment_exercise/repos/session_repo.dart';
import 'package:payment_exercise/use_cases/auth/login_use_case.dart';

/// Login page of the application.
class LoginPage extends StatefulWidget {
  /// Login page of the application.
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    final email = emailController.text;
    final password = passwordController.text;

    try {
      await LoginUseCase(
        getit.get<AuthRepo>(),
        getit.get<SessionRepo>(),
        getit.get<ProfileRepo>(),
        getit.get<SessionStore>(),
      ).execute(email, password);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.greenAccent,
          content: Text('Login successful'),
        ),
      );

      context.go('/profile');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: login,
            child: const Text('Login'),
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: () {
              context.go('/auth/register');
            },
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }
}
