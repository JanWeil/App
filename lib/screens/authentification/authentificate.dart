//sign in or register widget
import 'package:DHBuyW/screens/authentification/sign_in.dart';
import 'package:flutter/material.dart';

//Stateful widget
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();

}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SignIn(),
    );
  }
}