import 'package:flutter/material.dart';
import 'package:flutter_custom_toast/flutter_custom_toast.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey, 
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Toast Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ToastManager().showToast(
              message: 'Toast exibido sem context!',
              backgroundColor: Colors.blue,
            );
          },
          child: const Text('Mostrar Toast'),
        ),
      ),
    );
  }
}
