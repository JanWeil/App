import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:DHBuyW/utils/color_utils.dart';
import 'package:DHBuyW/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:DHBuyW/screens/congrats.dart';


class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();

}

class _ProductsState extends State<Products> {
// text fields' controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _storeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final CollectionReference _products =
  FirebaseFirestore.instance.collection('products');

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                  ),
                ),
                TextField(
                  controller: _storeController,
                  decoration: const InputDecoration(labelText: 'Store'),
                ),
                TextField(
                  controller: _imageController,
                  decoration: const InputDecoration(labelText: 'Image'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Beschreibung'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Create'),
                  onPressed: () async {
                    final String name = _nameController.text;
                    //    final String image = _nameController.text;
                    final String store = _storeController.text;
                    //  final String description = _nameController.text;
                    final double? price =
                    double.tryParse(_priceController.text);
                    if (price != null) {
                      await _products.add({"name": name, "price": price, "store": store});

                      _nameController.text = '';
                      _priceController.text = '';
                      _storeController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );

        });
  }


  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {

      _nameController.text = documentSnapshot['name'];
      _priceController.text = documentSnapshot['price'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text( 'Update'),
                  onPressed: () async {
                    final String name = _nameController.text;
                    final double? price =
                    double.tryParse(_priceController.text);
                    if (price != null) {

                      await _products
                          .doc(documentSnapshot!.id)
                          .update({"name": name, "price": price});
                      _nameController.text = '';
                      _priceController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _delete(String productId) async {
    await _products.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a product')));
  }

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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AuswahlWidget()));
          },
        ),
        title:  Text('Produkte',
          style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 22
          ),
        ),
        actions: [

        ],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: _products.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                streamSnapshot.data!.docs[index];
                return Card(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(
                            blurRadius: 3,
                            color: Color(0x3300000),
                            offset: Offset(0,2),
                          )
                          ],
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                      child: Text(
                                        //Datenbankzugriff!!?
                                        documentSnapshot['name'],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'Lexend Deca',
                                            color: Colors.black87,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                  )
                                ],
                              ),
                            ),
                            Divider(),
                            //Produktbild einfÃ¼gen
                            Image.network(documentSnapshot['image'],
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover
                            ),
                            Expanded(child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(16, 3, 16, 16),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async{

                                      final FirebaseAuth auth = FirebaseAuth.instance;
                                      final User? user = auth.currentUser;
                                      final uid = user?.uid;

                                       getUsername(){

                                        FirebaseFirestore.instance.collection("user").doc(uid).get()
                                            .then((DocumentSnapshot documentSnapshot) async{
                                           print(documentSnapshot["userName"]);

                                        //   final user = documentSnapshot["userName"];
                                      //    return documentSnapshot["userName"];
                                        });
                                       };
                                      await FirebaseFirestore.instance.collection('list').add({'userName' : uid, 'ProduktName' : documentSnapshot["name"],'Preis' : documentSnapshot["price"],'Laden' : documentSnapshot["store"]});

                                  //    FirebaseFirestore.instance.collection("list").snapshots().forEach((element) {
                                   //     for (QueryDocumentSnapshot snapshot in element.docs) {
                                   //       snapshot.reference.delete();
                                  //      }
                                 //     });

                                      //Anzahl erhÃ¶hen
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ThanksWidget()));
                                      print('Hinzufügen ...');
                                    },
                                    child: Text('Hinzufügen'),
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(hexStringToColor("F78181")),
                                    ),
                                  ),
                                  Expanded(child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                        child: Text(
                                          //Datenbankzugriff
                                          documentSnapshot['price'].toString()+' €',
                                          style: TextStyle(
                                            fontFamily: 'Lexend Daca',
                                            color: Colors.black87,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        //Datenbankzugriff
                                        documentSnapshot['store'],                                          textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontFamily: 'Lexend Daca',
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal
                                        ),
                                      ),
                                    ],
                                  ),
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



              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}