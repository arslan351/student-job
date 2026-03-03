import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_jobs/services/dioClient.dart';
import 'views/login/login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioClient().initialize();
  runApp(const ProviderScope(child : MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: const LoginScreen(),
    );
  }
}
