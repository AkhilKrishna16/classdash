import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  void _navigateToLogin() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, '/login_page');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Image.asset(
          'assets/ClassDash.png',
          height: 6 / 8 * height,
          width: 6 / 8 * width,
        ),
      ),
    );
  }
}
