import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class List extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
// text fields' controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  final CollectionReference _products =
  FirebaseFirestore.instance.collection('products');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Products')),
        ),
        body: StreamBuilder(
          stream: _products.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                  streamSnapshot.data!.docs[index];

                  //ab hier muss gewünschtes Layout eingerichtet werden
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(documentSnapshot['name']),
                      subtitle: Text(documentSnapshot['price'].toString()),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(

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
