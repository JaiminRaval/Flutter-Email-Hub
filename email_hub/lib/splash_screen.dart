import 'dart:async';
import 'package:email_hub/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
          () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 120.0,
                child: Image.asset('imgs/email.png'),
                backgroundColor: Colors.lightBlueAccent,
              ),
        
              Text("Email Hub", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              Text("Seemless Emailing, On the go!", style: TextStyle(fontSize: 15),)
            ],
          ),
        ),
      ),
    );
  }
}
