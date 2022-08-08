import 'package:cloud_firestore/cloud_firestore.dart';

class Database{
  static final _auth = FirebaseFirestore.instance;

  Future<void> write({
    required String collectionPath,
    String? documentPath,
    required Map<String,dynamic> data,
  }) =>
    _auth.collection(collectionPath)
    .doc(documentPath)
    .set(data);
  
  Query<Map<String, dynamic>> searchDocuments({
   required String collectionPath,String? documentPath,
   required String value,
  }) => _auth.collection(collectionPath)
  .where("searchList", arrayContainsAny: [value]);

  Future<QuerySnapshot<Map<String, dynamic>>> getRequestCollection({
   required String collectionPath,String? documentPath
  }) => _auth.collection(collectionPath).get();

  Future<DocumentSnapshot<Map<String, dynamic>>> getRequestDocument({
   required String collectionPath,required String documentPath
  }) => _auth.collection(collectionPath).doc(documentPath).get();
}