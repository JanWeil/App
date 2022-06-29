//Wrapper, der entscheidet, ob authentification oder home angezeigt wird
//Stateless Widget

import 'package:DHBuyW/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home(
    //return Home or Authentificate

    );
  }
}