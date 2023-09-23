import 'dart:async';

import 'package:flutter/material.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  initState() {
    super.initState();

    Duration duration = const Duration(seconds: 6);

    Timer(duration, () {
      Navigator.of(context).pushReplacementNamed('Contact_page');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_call),
              iconSize: 200,
            ),
            const CircularProgressIndicator(
              color: Colors.blue,
            ),
            const Text(
              "Made With in India",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
