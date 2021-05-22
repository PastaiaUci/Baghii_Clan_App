import 'package:baghii_clan/models/Baghiu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:baghii_clan/models/user_data_model.dart';


class  DatabaseService{

  final String uid;

  DatabaseService({this.uid});

  //reference to the baghiuCollection collection
  final CollectionReference baghiuCollection = FirebaseFirestore.instance.collection('baghii');

  //updates the user data with the input given from user
  Future updateUserData(String name,String profile_pic,String profile_pic_url) async {
     return  await  baghiuCollection.doc(uid).set({
          'name':name,
          'profile_pic':profile_pic,
          'profile_pic_url':profile_pic_url
     });
  }

  //baghii list from the  snapshot
  List<Baghiu> baghiiListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
       return Baghiu(
           status:doc.data()['name'] ?? '',
           profile_pic:doc.data()['profile_pic'] ?? '',
           profile_pic_url:doc.data()['profile_pic_url'] ?? '',
       );
    }).toList();
  }

  //get baghii stream
  Stream< List<Baghiu>> get baghii{
    return baghiuCollection.snapshots().map(
        baghiiListFromSnapshot);
  }

  // user data from snapshots
  UserData userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data()['name'] ?? '',
        profile_pic:snapshot.data()['profile_pic'] ?? '',
        profile_pic_url:snapshot.data()['profile_pic_url'] ?? '',

    );
  }


  // get user doc stream
  Stream<UserData> get userData {
    return baghiuCollection.doc(uid).snapshots()
        .map(userDataFromSnapshot);
  }

}