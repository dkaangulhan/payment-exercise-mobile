import 'package:flutter/material.dart';
import 'package:payment_exercise/app/init/initialize_data.dart';
import 'package:payment_exercise/app/init/register_dependencies.dart';
import 'package:payment_exercise/app/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

/// Entry point of the application.
class MyApp extends StatefulWidget {
  /// Entry point of the application.
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigatorKey = GlobalKey<NavigatorState>();
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();

    _init();
  }

  Future<void> _init() async {
    RegisterDependencies.init();
    await InitializeData().init();
    setState(() {
      print('Initialized');
      isInitialized = true;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (!isInitialized) {
      MaterialApp(
        title: 'iyzico Payment Exercise',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return MaterialApp.router(
      title: 'iyzico Payment Exercise',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: AppRouter.router,
    );
  }
}
