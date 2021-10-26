import 'package:fittness_app/pages/onboarding_page.dart';
import 'package:fittness_app/providers/exercicios_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: ( _ ) => ExerciseProvider() ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: OnBoardingPage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xFF1a237e)
        )
      ),
    );
  }
}