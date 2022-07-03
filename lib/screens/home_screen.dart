import 'package:DHBuyW/Objects/Pool.dart';
import 'package:DHBuyW/screens/basket_screen.dart';
import 'package:DHBuyW/screens/congrats.dart';
import 'package:DHBuyW/screens/laden_screen.dart';
import 'package:DHBuyW/screens/list_screen.dart';
import 'package:DHBuyW/screens/shopping_screen.dart';
import 'package:DHBuyW/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:DHBuyW/Objects/Pool.dart';

class AuswahlWidget extends StatefulWidget {
  const AuswahlWidget({Key? key}) : super(key: key);

  @override
  _AuswahlWidgetState createState() => _AuswahlWidgetState();
}

class _AuswahlWidgetState extends State<AuswahlWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFB71C1C),
        automaticallyImplyLeading: false,
        title: Text(
          'Home',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 8, 0, 0),
                child: Text(
                  '',
                  style: TextStyle(color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: double.infinity,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child:
                          ElevatedButton(
                            onPressed: () {
                              print('Button pressed ...');
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => HomeScreen()));
                            },
                            child: Text('Bestellen',
                                style: TextStyle(
                                  fontSize: 23
                                ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(hexStringToColor("F78181"),
                            ),
                          ),
                        ),
                        ),
                      ),
                    ),

                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 44),
                child: ListView(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                      child: ElevatedButton(
                        onPressed: () {
                          print('Button pressed ...');
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ListWidget()));
                        },
                        child: Text('Einkaufsliste anzeigen', style: TextStyle(color: Colors.black54),),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(hexStringToColor("F6CECE")),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

