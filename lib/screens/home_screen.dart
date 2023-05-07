import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamline/providers/user_provider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: Center(
        child: Text(
          userProvider.user.username,
        ),
      ),
    );
  }
}
