import 'package:firebase_auth/firebase_auth.dart';
import 'package:baghii_clan/models/user.dart';
import 'package:baghii_clan/services/database.dart';
class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;


  // create only a user with only the uid
  User_model _UserFromFirebaseUser(User user){
     return user != null ? User_model(uid:user.uid ) :null;
   }

   // stream to check the status(log in/log out) of the user
  Stream<User_model> get user{
    return _auth.authStateChanges()
        .map(_UserFromFirebaseUser);
  }


// register with email and password
  Future signInWithEmailAndPassword(String email,String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user  = result.user;



      return _UserFromFirebaseUser(user);

    }catch(e){
      print(e.toString());
      return null;
    }

  }


  // register with email and password
  Future registerWithEmailAndPassword(String email,String password) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user  = result.user;
      //create a new document for the user with the same uid
      await DatabaseService(uid: user.uid).updateUserData('Gay','default_picture','profile_pic_url');
      return _UserFromFirebaseUser(user);

    }catch(e){
        print(e.toString());
        return null;
    }

  }

  // sign out
  Future signOut() async {

    try{
          return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}