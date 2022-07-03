import 'package:DHBuyW/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:DHBuyW/reusable_widgets/reusable_widget.dart';
import 'package:DHBuyW/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _paypalTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        "Sign Up",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4")
            ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Username", Icons.person_outline, false, _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email ID", Icons.person_outline, false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter PayPal Link", Icons.cached_outlined, true, _paypalTextController),
                const SizedBox(
                  height: 20,
                ),
                firebaseButton(context, "Sign Up", () {
                  //Signup (User erstellen)
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text).then((value) {
                        //Datenbankeintrag

                    addUserDetails(
                    _userNameTextController.text.trim(),
                        _emailTextController.text.trim(),
                      _passwordTextController.text.trim(),
                      _paypalTextController.text.trim(),

                    );

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AuswahlWidget()));
                  });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future addUserDetails(String userName, String email, String password, String paypal) async {
    await FirebaseFirestore.instance.collection('user').add({
      'userName': userName,
      'password': password,
      'email': email,
      'paypal': paypal,
    });
  }

}
