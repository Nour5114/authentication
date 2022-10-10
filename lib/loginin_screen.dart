import 'package:authenticationproject/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final auth = FirebaseAuth.instance;
  bool isHidden = true;
  late String email;
  late String password;

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
            const SizedBox(
              height: 180,
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: Color(0xff2e386b),
                ),
              ),
            ),
            const SizedBox(height: 50),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Enter your Email',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              obscureText: isHidden,
              decoration: InputDecoration(
                hintText: 'Enter your password',
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                suffixIcon: InkWell(
                  child: isHidden
                      ? const Icon(
                          Icons.visibility,
                        )
                      : const Icon(
                          Icons.visibility_off,
                        ),
                  onTap: () {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  },
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            MyButton(
              color: Colors.yellow[900]!,
              title: 'login',
              onPressed: () {
                try {
                  auth.signInWithEmailAndPassword(email: email, password: password);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomeScreen()));
                } catch (e) {
                  print(e);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
