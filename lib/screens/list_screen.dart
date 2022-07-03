import 'package:DHBuyW/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:DHBuyW/utils/color_utils.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  bool? checkboxListTileValue1;
  bool? checkboxListTileValue2;
  bool? checkboxListTileValue3;
  bool? checkboxListTileValue4;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFB71C1C),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            print('IconButton pressed ...');
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AuswahlWidget()));
          },
        ),
        title: Text(
          'Einkaufsliste',
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
      backgroundColor: Color(0xFFF1F4F8),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 7,
                        color: Color(0x2E000000),
                        offset: Offset(0, 4),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          //Preis
                          '\$2,593.00',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            color: Color(0x82B71C1C),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Text(
                            'Summe',
                            style:
                            TextStyle(
                              fontFamily: 'Outfit',
                              color: Color(0xFF57636C),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Person 1',
                        style: TextStyle(color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)
                    ),
                  ],
                ),
              ),
              ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          unselectedWidgetColor: Color(0xFF95A1AC),
                        ),
                        child: CheckboxListTile(
                          value: checkboxListTileValue1 ??= false,
                          onChanged: (newValue) =>
                              setState(() => checkboxListTileValue1 = newValue),
                          title: Text(
                            'Produktname',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16
                            ),
                          ),
                          subtitle: Text(
                            'Anzahl',
                            style: TextStyle(color: Colors.grey),
                          ),
                          tileColor: Color(0xFFF5F5F5),
                          activeColor:
                          Colors.blueGrey,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding:
                          EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          unselectedWidgetColor: Color(0xFF95A1AC),
                        ),
                        child: CheckboxListTile(
                          value: checkboxListTileValue2 ??= false,
                          onChanged: (newValue) =>
                              setState(() => checkboxListTileValue2 = newValue),
                          title: Text(
                            'Produktname',
                            style: TextStyle(color: Colors.black),
                          ),
                          subtitle: Text(
                            'Anzahl',
                            style: TextStyle(color: Colors.grey),
                          ),
                          tileColor: Color(0xFFF5F5F5),
                          activeColor:
                          Colors.blueGrey,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding:
                          EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //Neue Person
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Person 2',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          unselectedWidgetColor: Color(0xFF95A1AC),
                        ),
                        child: CheckboxListTile(
                          value: checkboxListTileValue3 ??= false,
                          onChanged: (newValue) =>
                              setState(() => checkboxListTileValue3 = newValue),
                          title: Text(
                            'Produktname',
                            style: TextStyle(color: Colors.black),
                          ),
                          subtitle: Text(
                            'Anzahl',
                            style: TextStyle(color: Colors.grey),
                          ),
                          tileColor: Color(0xFFF5F5F5),
                          activeColor:
                          Colors.white,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding:
                          EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          unselectedWidgetColor: Color(0xFF95A1AC),
                        ),
                        child: CheckboxListTile(
                          value: checkboxListTileValue4 ??= false,
                          onChanged: (newValue) =>
                              setState(() => checkboxListTileValue4 = newValue),
                          title: Text(
                            'Produktname',
                            style: TextStyle(color: Colors.black),
                          ),
                          subtitle: Text(
                            'Anzahl',
                            style: TextStyle(color: Colors.grey),
                          ),
                          tileColor: Color(0xFFF5F5F5),
                          activeColor:
                          Colors.white,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding:
                          EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 4),child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      print('Button pressed ...');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AuswahlWidget()));
                    },
                    child: Text('Abschließen'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(hexStringToColor("F78181")),
                    ),
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