import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_jobs/providers/authProvider.dart';
import 'package:student_jobs/services/dioClient.dart';
import 'package:student_jobs/views/home.dart';
import 'views/login/login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioClient().initialize();
  runApp(const ProviderScope(child : MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(
        authStateProvider.select((state)=>state.isAuthenticated)
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      //home:  const LoginScreen(),
      home: isAuthenticated
        ? Home()
        : const LoginScreen()
    );
  }
}
