import 'package:flutter/material.dart';
import 'package:DHBuyW/utils/color_utils.dart';

class Hintergrund extends StatefulWidget {
  const Hintergrund({Key? key}) : super(key: key);

  @override
  State<Hintergrund> createState() => _HintergrundState();
}

class _HintergrundState extends State<Hintergrund> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, appBar: AppBar(
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
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("B71C1C"),
              hexStringToColor("F78181"),
              hexStringToColor("F6CECE")
            ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)
        ),
      ),
    );
  }
}
