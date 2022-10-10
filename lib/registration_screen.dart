// ignore_for_file: use_build_context_synchronously

import 'package:authenticationproject/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}



late String email;
late String password;
bool isHidden = true;
final auth = FirebaseAuth.instance;

class RegistrationScreenState extends State<RegistrationScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

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
                'SignUp',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: Color(0xff2e386b),
                ),
              ),
            ),
            const SizedBox(height: 50),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
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
              color: Colors.blue[800]!,
              title: 'register',
              onPressed: () async {
                try {
                  final newUser = await auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  email = '';
                  password ='';
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
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
  void getCurrentUser(){
    try{
      User signedInUser;
      final user = auth.currentUser;

      if(user != null){
        signedInUser = user;
        print(signedInUser.email);
      }
    }catch(e){
      print(e);
    }
  }
}
