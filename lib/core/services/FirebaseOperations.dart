import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pizzato_mvvm/app/routes.dart';

class FirebaseOperations {
  FirebaseFirestore instance = FirebaseFirestore.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final storage = new FlutterSecureStorage();
  Future logInViaGoogle() async {
    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
          await firebaseAuth.signInWithCredential(authCredential);

      final User user = userCredential.user;
      await storage.write(key: 'uid', value: user.uid);
      String value = await storage.read(key: 'uid');
      print('GOOGLE USER UIDDDD =>' + value);
      Routes.sailor.navigate('/home_screen');
    } catch (e) {
      print('THIS IS ERROR FROM GOOGLE LOGIN');
      print(e);
    }
  }

  Future signOutWithGoogle() async {
    await googleSignIn.signOut();
  }

  Future<List<QueryDocumentSnapshot<Object>>> fetchData(
      BuildContext context, String collection,
      [String foodType]) async {
    if (collection == 'favourite') {
      if (foodType != 'allFood') {
        QuerySnapshot querySnapshot = await instance
            .collection(collection)
            .where('category', isEqualTo: foodType)
            .get();
        return querySnapshot.docs;
      }
      QuerySnapshot querySnapshot = await instance.collection(collection).get();
      return querySnapshot.docs;
    } else if (collection == 'business') {
      QuerySnapshot querySnapshot = await instance.collection(collection).get();
      return querySnapshot.docs;
    }
  }
}
