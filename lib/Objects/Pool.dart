//LÖSCHEN!!!!!

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:DHBuyW/utils/color_utils.dart';


class PoolWidget extends StatefulWidget {
const PoolWidget({Key? key}) : super(key: key);

@override
_PoolWidgetState createState() => _PoolWidgetState();
}

class _PoolWidgetState extends State<PoolWidget> {
// text fields' controllers
final TextEditingController _nameController = TextEditingController();
final TextEditingController _priceController = TextEditingController();

final CollectionReference _pool =
FirebaseFirestore.instance.collection('pool');

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
const SizedBox(
height: 20,
),
ElevatedButton(
child: const Text('Create'),
onPressed: () async {
final String name = _nameController.text;
final double? price =
double.tryParse(_priceController.text);
if (price != null) {
await _pool.add({"name": name, "price": price});

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

await _pool
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
await _pool.doc(productId).delete();

ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
content: Text('You have successfully deleted a product')));
}

@override
Widget build(BuildContext context) {
return  StreamBuilder(
stream: _pool.snapshots(),
builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
if (streamSnapshot.hasData) {
return ListView.builder(
itemCount: streamSnapshot.data!.docs.length,
itemBuilder: (context, index) {
final DocumentSnapshot documentSnapshot =
streamSnapshot.data!.docs[index];
return Padding(
  padding:
  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
  child: ElevatedButton(
    onPressed: () {
      print('Button pressed ...');
    },
    child: Text( 'Beitreten'),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(hexStringToColor("F78181")),
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
);
}
}