import 'package:flutter/material.dart';

// THIS FILE DOES NOT CONTAINS ANY LOGIC RELATED TO APPLICATION/BUSINESS

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Made by Jaimin Raval with {❤} & care!",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87
                ),
              ),
            ],
          ),
        ),
      );

  }
}
