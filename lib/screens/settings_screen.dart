import 'package:DHBuyW/Objects/Pool.dart';
import 'package:DHBuyW/reusable_widgets/reusable_widget.dart';
import 'package:DHBuyW/screens/basket_screen.dart';
import 'package:DHBuyW/screens/congrats.dart';
import 'package:DHBuyW/screens/laden_screen.dart';
import 'package:DHBuyW/screens/list_screen.dart';
import 'package:DHBuyW/screens/shopping_screen.dart';
import 'package:DHBuyW/screens/signin_screen.dart';
import 'package:DHBuyW/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:DHBuyW/Objects/Products.dart';
import 'package:DHBuyW/Objects/List.dart';
import 'package:DHBuyW/screens/home_screen.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
          'Einstellungen',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
                Icons.logout,
                color: Colors.white,
                size: 30
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              });
            },
          )
        ],
        centerTitle: true,
        elevation: 2,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.person_outline,
                  color: Colors.black26,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            Divider(
              height: 20,
              thickness: 1,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Benutzername',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'PayPal Link',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey
                    ),
                  ),
                ],
              ),
            ),

            buildPasswordOption(context, "Passwort ändern"),

            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                });
              },
              child: Text('Log out',
                style: TextStyle(
                    fontSize: 23
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(hexStringToColor("F78181"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildPasswordOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Passwort zurücksetzen'
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Klicke auf den Button, um dein Passwort zurückzusetzen'),
                ElevatedButton(
                    onPressed: () {
                      //Email vom Benutzer ziehen????
                      FirebaseAuth.instance.sendPasswordResetEmail(email: _emailTextController.text)
                          .then((value) => Navigator.of(context).pop());
                    },
                    child: Text(
                      'Zurücksetzen'
                    ),
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Schließen'
                  )
              )
            ],
          );

        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey
            ),
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
