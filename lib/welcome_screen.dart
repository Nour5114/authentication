import 'package:authenticationproject/registration_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: Color(0xff2e386b),
                ),
              ),
            ),
            const SizedBox(height: 30),
            MyButton(
              color: Colors.yellow[900]!,
              title: 'Sign out',
              onPressed: () {
                auth.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
