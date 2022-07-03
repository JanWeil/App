import 'package:DHBuyW/screens/basket_screen.dart';
import 'package:DHBuyW/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = "";

  TextEditingController? searchFildController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print('completed');
      setState(() {});
    });
    //searchFieldController = TextEditingController();
  }

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
          'Shop',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              print('IconButton pressed ...');
              //Navigation
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BasketWidget()));
            },
          ),
        ],
        centerTitle: true,
        elevation: 2,
      ),
      //großer Hintergrund
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Material(
            color: Colors.transparent,
            elevation: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white60,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.black12,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 4),
                child: TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Type to search here...',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black54,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:
                        Colors.black54,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: Colors.black54,
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  onChanged: (val) {
                    setState() {
                      name = val;
                    }
                  },
                ),
              ),
            ),
          )
        ],
      ),
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('products').snapshots(),
                  builder: (context, snapshots) {
                    if(snapshots.hasData) {
                      return
                        ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshots.data!.docs.length,
                            itemBuilder: (context, index) {
                              var data = snapshots.data!.docs[index].data()
                              as Map<String, dynamic>;
                              if (name.isEmpty) {
                                return ListView(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 12, 16, 0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 300,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 3,
                                              color: Color(0x33000000),
                                              offset: Offset(0, 2),
                                            )
                                          ],
                                          borderRadius: BorderRadius.circular(
                                              8),
                                        ),
                                        child: Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(
                                                8),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment
                                                .start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 16, 16, 0),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize
                                                      .max,
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                          data['name'],
                                                          textAlign: TextAlign
                                                              .center,
                                                          style: TextStyle(
                                                            fontFamily: 'Lexend Deca',
                                                            color: Colors
                                                                .black87,
                                                            fontSize: 24,
                                                            fontWeight: FontWeight
                                                                .bold,
                                                          ),
                                                        )
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Divider(),
                                              //Bild einfügen !!!!!!!!!!!!!
                                              Image.network(
                                                'https://picsum.photos/seed/206/600',
                                                width: 150,
                                                height: 150,
                                                fit: BoxFit.cover,
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16, 3, 16, 16),
                                                  child: Row(
                                                      mainAxisSize: MainAxisSize
                                                          .max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                      crossAxisAlignment: CrossAxisAlignment
                                                          .end,
                                                      children: [
                                                        ElevatedButton(
                                                            onPressed: () {
                                                              print(
                                                                  'Artikel hinzugefügt');
                                                              //Prüfen, ob Bestellung offen,
                                                              //Bestellung anlegen
                                                              //Produkt zu Bestellung hinzufügen
                                                              //Anzahl erhöhen
                                                            },
                                                            child: Text(
                                                                'Hinzufügen')
                                                        ),
                                                        Expanded(
                                                            child: Column(
                                                                mainAxisSize: MainAxisSize
                                                                    .max,
                                                                mainAxisAlignment: MainAxisAlignment
                                                                    .end,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        0, 0, 0,
                                                                        4),
                                                                    child: Text(
                                                                      data['price']
                                                                          .toString(),
                                                                      style: TextStyle(
                                                                        fontFamily: 'Lexend Deca',
                                                                        color: Colors
                                                                            .black87,
                                                                        fontSize: 20,
                                                                        fontWeight: FontWeight
                                                                            .bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    //documentSnapshot['anzahl'],
                                                                    'Anzahl',
                                                                    textAlign: TextAlign
                                                                        .end,
                                                                    style: TextStyle(
                                                                      fontFamily: 'Lexend Deca',
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize: 14,
                                                                      fontWeight: FontWeight
                                                                          .normal,
                                                                    ),
                                                                  )
                                                                ]
                                                            )
                                                        )
                                                      ]
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )


                                  ],
                                );
                              }
                              if (
                              data['name'].toString().toLowerCase().startsWith(
                                  name.toLowerCase())
                              ) {
                                return ListView(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 12, 16, 0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 300,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 3,
                                              color: Color(0x33000000),
                                              offset: Offset(0, 2),
                                            )
                                          ],
                                          borderRadius: BorderRadius.circular(
                                              8),
                                        ),
                                        child: Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(
                                                8),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment
                                                .start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 16, 16, 0),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize
                                                      .max,
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                          data['name'],
                                                          textAlign: TextAlign
                                                              .center,
                                                          style: TextStyle(
                                                            fontFamily: 'Lexend Deca',
                                                            color: Colors
                                                                .black87,
                                                            fontSize: 24,
                                                            fontWeight: FontWeight
                                                                .bold,
                                                          ),
                                                        )
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Divider(),
                                              //Bild einfügen !!!!!!!!!!!!!
                                              Image.network(
                                                'https://picsum.photos/seed/206/600',
                                                width: 150,
                                                height: 150,
                                                fit: BoxFit.cover,
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16, 3, 16, 16),
                                                  child: Row(
                                                      mainAxisSize: MainAxisSize
                                                          .max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                      crossAxisAlignment: CrossAxisAlignment
                                                          .end,
                                                      children: [
                                                        ElevatedButton(
                                                            onPressed: () {
                                                              print(
                                                                  'Artikel hinzugefügt');
                                                              //Prüfen, ob Bestellung offen,
                                                              //Bestellung anlegen
                                                              //Produkt zu Bestellung hinzufügen
                                                              //Anzahl erhöhen
                                                            },
                                                            child: Text(
                                                                'Hinzufügen')
                                                        ),
                                                        Expanded(
                                                            child: Column(
                                                                mainAxisSize: MainAxisSize
                                                                    .max,
                                                                mainAxisAlignment: MainAxisAlignment
                                                                    .end,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        0, 0, 0,
                                                                        4),
                                                                    child: Text(
                                                                      data['price']
                                                                          .toString(),
                                                                      style: TextStyle(
                                                                        fontFamily: 'Lexend Deca',
                                                                        color: Colors
                                                                            .black87,
                                                                        fontSize: 20,
                                                                        fontWeight: FontWeight
                                                                            .bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    //documentSnapshot['anzahl'],
                                                                    'Anzahl',
                                                                    textAlign: TextAlign
                                                                        .end,
                                                                    style: TextStyle(
                                                                      fontFamily: 'Lexend Deca',
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize: 14,
                                                                      fontWeight: FontWeight
                                                                          .normal,
                                                                    ),
                                                                  )
                                                                ]
                                                            )
                                                        )
                                                      ]
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )


                                  ],
                                );
                              }
                              return Container();
                            }
                        );
                    }
                    else
                      return Container();

                  }
              ),
          ),
      ],
    ),
    );
  }
}

