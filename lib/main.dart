
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'views/tap_screen_v.dart';
import 'views/history_screen_v.dart';
import 'firebase_options.dart';
import 'views/dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter NFC App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  DashboardView(),
    );
  }
}
