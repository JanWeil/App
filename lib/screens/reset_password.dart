import 'package:DHBuyW/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:DHBuyW/reusable_widgets/reusable_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        "Passwort Zurücksetzen",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("B71C1C"),
              hexStringToColor("F78181"),
              hexStringToColor("F6CECE")
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
                //Form Validation?????????????????????????!!!!!!!!!!!!!!!
                reusableTextField("Enter Email ID", Icons.person_outline, false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                //Reset Button
                firebaseButton(context, "Zurücksetzen", () {
                  FirebaseAuth.instance.sendPasswordResetEmail(email: _emailTextController.text)
                      .then((value) => Navigator.of(context).pop());
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
