import 'dart:async';

import 'package:di_example/config/routes/app_routes.dart';
import 'package:flutter/material.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/02/2022 at 13:42.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class SplashScreen extends StatefulWidget {
  final String title;

  const SplashScreen({Key? key, this.title='Welcome to Flutter',}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.title),
      ),
    );
  }

  _startTimer() {
    _timer = Timer(const Duration(seconds: 2), () {
      _goNext();
    });
  }

  _goNext() {
    Navigator.pushNamed(context, Routes.quotesScreen);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
