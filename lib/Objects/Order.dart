import 'package:DHBuyW/Objects/Products.dart';
import 'package:DHBuyW/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
// text fields' controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  final CollectionReference _orders =
  FirebaseFirestore.instance.collection('orders');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFB71C1C),
          automaticallyImplyLeading: false,
          leading: IconButton(
            //borderColor: Colors.transparent,
            //borderRadius: 30,
            //borderWidth: 1,
            //buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              print('IconButton pressed ...');
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => Products()));
            },
          ),
          title: Text(
            'Bestellung',
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
        body: SafeArea(
        child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
        child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
        child: Text(
        'Bestellung',
        style: TextStyle(
        color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24
        ),
        ),
        ),
        Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
        child:
        Container(
          child: Column(
            children: [
              //Bestellen Button
              /*Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
                child: ElevatedButton(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  child: Text( 'Bestellen'),
                ),
              ),*/


        StreamBuilder(
          stream: _orders.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.zero,
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                  streamSnapshot.data!.docs[index];

                  //ab hier muss gewünschtes Layout eingerichtet werden
                  return Card(
                    child:
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                      child: Container(
                        width: double.infinity,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x520E151B),
                              offset: Offset(0,2)
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              /*ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: //Bild Einfügen
                                Image.network('src',
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ) ,
                              ),*/
                              Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          //Datenbankzugriff
                                          'Produkt',
                                          style: TextStyle(
                                            color: Colors.black
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                          child: Text(
                                            //Datenbankzugriff
                                            'Anzahl',
                                            style: TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ),
                              Text(
                                //Datenbankzugriff + Rechnung
                                'Summe',
                                style: TextStyle(color: Colors.black87
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.delete_forever_outlined,
                                    color: Color(0xFFB71C1C),
                                    size: 15,
                                  ),
                                  onPressed: () {
                                    //delete Funktion für Produkt ausführen
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }

              return  Card(
                child:
                  Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
                      child: ElevatedButton(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        child: Text( 'Bestellen'),
                      ),
                    ),
                  ],
                ),
              ),
              );
          },
        ),
            ],
          ),
        ),

        ),
      ],
    ),
    ),
    ),
    ),
    );
  }
}

