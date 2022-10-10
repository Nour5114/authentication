import 'package:authenticationproject/loginin_screen.dart';
import 'package:authenticationproject/registration_screen.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                color: Color(0xff2e386b),
              ),
            ),
            const SizedBox(height: 30),
            MyButton(
              color: Colors.yellow[900]!,
              title: 'Login in',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
              },
            ),
            MyButton(
              color: Colors.blue[800]!,
              title: 'register',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.color, required this.title, required this.onPressed});

  final Color color;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 5,
        color: color,
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          onPressed: () => onPressed(),
          minWidth: 200,
          height: 42,
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
