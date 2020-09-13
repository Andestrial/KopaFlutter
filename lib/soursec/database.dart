
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:koap_app/data/repositories/user_repositories.dart';
import 'package:koap_app/domain/model/kopa_model.dart';
import 'package:koap_app/domain/model/user_model.dart';

class Database {

  final db = Firestore.instance;


  Future<DocumentSnapshot> getUser()async{
    final uid = await UserRepositories().getCurrentUser();
    DocumentSnapshot documentSnapshot = await db.collection('users').document('${uid.uid}').get();
    return documentSnapshot;
  }

  Future<void> createUser (User user) async{
    final uid = await UserRepositories().getCurrentUser();
    await db.collection('users').document('${uid.uid}').setData(user.toFirebase());
  }

  Future createPost (KopaModel kopa) async{
    final user = await UserRepositories().getCurrentUser();
    await db.collection('Kopas').add(
      kopa.toFirebase()
    );
    return user;
  }
}