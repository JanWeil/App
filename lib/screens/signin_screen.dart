import 'package:DHBuyW/screens/home_screen.dart';
import 'package:DHBuyW/screens/reset_password.dart';
import 'package:DHBuyW/screens/signup.dart';
import 'package:DHBuyW/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:DHBuyW/reusable_widgets/reusable_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        //Hintergrund
        decoration: BoxDecoration(gradient: LinearGradient(colors:
        [hexStringToColor("B71C1C"),
          hexStringToColor("F78181"),
          hexStringToColor("F6CECE")
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
          child: Column(
            children: <Widget> [
              //Logo einfügen mit name in assets images ordner
              logoWidget('assets/images/applogo.png'),
              const SizedBox(
                height: 20,
              ),
            reusableTextField("Enter UserName", Icons.person_outline, false, _emailTextController),
            const SizedBox(
              height: 20,
            ),
            reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),
              const SizedBox(
                height: 3,
              ),
              //Forgot Password
              forgetPassword(context),
              firebaseButton(context, "Sign In", () {
                FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text,
                    password: _passwordTextController.text).then((value) {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AuswahlWidget()));
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
              }),
              signUpOption()
            ]
          ),
    ),
    ),
      ),
    );
  }

  //Funktion für Signup
  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        const Text("Dont't habe account? ",
        style: TextStyle(color: Colors.white70)
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text("Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: Text("Passwort vergessen?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => ResetPasswordScreen())),
      ),
    );
  }
}
