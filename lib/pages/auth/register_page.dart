import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exercise/common/getit.dart';
import 'package:payment_exercise/global_stores/session_store.dart';
import 'package:payment_exercise/repos/auth_repo.dart';
import 'package:payment_exercise/repos/profile_repo.dart';
import 'package:payment_exercise/repos/session_repo.dart';
import 'package:payment_exercise/use_cases/auth/register_use_case.dart';

/// Register page of the application.
class RegisterPage extends StatefulWidget {
  /// Register page of the application.
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final gsmNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    gsmNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> register() async {
    final name = nameController.text;
    final surname = surnameController.text;
    final gsmNumber = gsmNumberController.text;
    final email = emailController.text;
    final password = passwordController.text;

    try {
      await RegisterUseCase(
        getit.get<AuthRepo>(),
        getit.get<SessionRepo>(),
        getit.get<ProfileRepo>(),
        getit.get<SessionStore>(),
      ).execute(email, name, surname, gsmNumber, password);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.greenAccent,
          content: Text('Registered successfully.'),
        ),
      );

      context.go('/');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text('Error: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: surnameController,
            decoration: const InputDecoration(
              labelText: 'Surname',
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: gsmNumberController,
            decoration: const InputDecoration(
              labelText: 'GSM Number',
            ),
          ),
          const SizedBox(height: 8),
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
            onPressed: register,
            child: const Text('Register'),
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: () {
              context.go('/auth/login');
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
