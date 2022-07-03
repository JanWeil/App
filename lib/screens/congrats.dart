import 'package:DHBuyW/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:DHBuyW/screens/home_screen.dart';

class ThanksWidget extends StatefulWidget {
  const ThanksWidget({Key? key}) : super(key: key);

  @override
  _ThanksWidgetState createState() => _ThanksWidgetState();
}

class _ThanksWidgetState extends State<ThanksWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFB71C1C),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle_outlined,
                      color: Colors.white,
                      size: 150,
                    ),
                  ],
                ),
              ),
              Text(
                'Glückwunsch!',
                style: TextStyle(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Text(
                  'Deine Bestellung wurde aufgegeben!',
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AuswahlWidget()));
                  },
                  child: Text(
                    'Zurück',
                    style: TextStyle(
                      color: Color(0x82B71C1C),
                      fontSize: 16,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.normal
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

