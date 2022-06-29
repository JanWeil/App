import 'package:firebase_auth/firebase_auth.dart';
import 'package:DHBuyW/models/user.dart';

class AuthService {

  final FirebaseAuth  _auth = FirebaseAuth.instance;

  //create User object based on FirebaseUser
  Benutzer _userFromUser(Benutzer user) {
    return user = Benutzer(uid: user.uid);

    //auth change user stream
    //Stream<Benutzer> get user {
      //return _auth.onAuthStateChanged;
      //.map((FirebaseUser user) => _userFromFirebaseUser(user)); = ist das gleiche
      //.map(_userFromUser);
  }


  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email & password

  //register with email & password

  //sign out

}