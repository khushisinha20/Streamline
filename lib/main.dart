import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:streamline/providers/user_provider.dart';
import 'package:streamline/resources/auth_methods.dart';
import 'package:streamline/screens/home_screen.dart';
import 'package:streamline/screens/login_screen.dart';
import 'package:streamline/screens/onboarding_screen.dart';
import 'package:streamline/screens/signup_screen.dart';
import 'package:streamline/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:streamline/models/user.dart' as model;
import 'package:streamline/widgets/loading_indicator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB6KAw-n9psFmlVz7wpf2-fFmDTbnLex18",
          authDomain: "streamline-f2a12.firebaseapp.com",
          projectId: "streamline-f2a12",
          storageBucket: "streamline-f2a12.appspot.com",
          messagingSenderId: "302533791208",
          appId: "1:302533791208:web:d39e9c0c910d565826e85d"),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => UserProvider(),
    ),
  ], child: const MyApp()));
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
        LoginScreen.routeName: (context) => const LoginScreen(),
        SignupScreen.routeName: (context) => const SignupScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
      home: FutureBuilder(
        future: AuthMethods()
            .getCurrentUser(FirebaseAuth.instance.currentUser != null
                ? FirebaseAuth.instance.currentUser!.uid
                : null)
            .then((value) {
          if (value != null) {
            Provider.of<UserProvider>(context, listen: false).setUser(
              model.User.fromMap(value),
            );
          }
        }),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingIndicator();
          }

          if (snapshot.hasData) {
            return const HomeScreen();
          }

          return const OnboardingScreen();
        },
      ),
    );
  }
}
