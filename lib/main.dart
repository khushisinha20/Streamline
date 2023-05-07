import 'package:flutter/material.dart';
import 'package:streamline/screens/onboarding_screen.dart';
import 'package:streamline/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Streamline',
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: backgroundColor,
          appBarTheme: AppBarTheme.of(context).copyWith(
            backgroundColor: backgroundColor,
            elevation: 0,
            titleTextStyle: const TextStyle(
              color: primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            iconTheme: const IconThemeData(
              color: primaryColor,
            ),
          )),
      routes: {
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
      },
      home: const OnboardingScreen(),
    );
  }
}
