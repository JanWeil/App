import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:DHBuyW/screens/home_screen.dart';


class EinkaufsList extends StatefulWidget {
  const EinkaufsList({Key? key}) : super(key: key);

  @override
  _EinkaufsListState createState() => _EinkaufsListState();
}

class _EinkaufsListState extends State<EinkaufsList> {
// text fields' controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  final CollectionReference _list =
  FirebaseFirestore.instance.collection('list');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

        body:
        StreamBuilder(
          stream: _list.snapshots(),
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
                        height: 120,
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
                                  documentSnapshot['userName'],
                                        style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Divider(),
                                      Text(
                                        //Datenbankzugriff
                                       documentSnapshot['Preis'],
                                        style: TextStyle(
                                            color: Colors.black
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                        child: Text(
                                          //Datenbankzugriff
                                          documentSnapshot['Laden'],
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                        child: Text(
                                          //Datenbankzugriff
                                          'Preis:  '+documentSnapshot['ProduktName'].toString()+' €',
                                          style: TextStyle(color: Colors.redAccent,
                                          fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              /*Text(
                                //Datenbankzugriff + Rechnung
                                'Summe',
                                style: TextStyle(color: Colors.black87
                                ),
                              ),*/
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.check_outlined,
                                    color: Colors.lightGreen,
                                    size: 20,
                                  ),
                                  onPressed: () {

                                    Future<void> _delete(String listId) async {
                                      await _list.doc(listId).delete();

                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                          content: Text('You have successfully deleted a product')));
                                    }

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

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
// Add new product
    
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}
