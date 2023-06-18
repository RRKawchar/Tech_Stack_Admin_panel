import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageHelpers{

 static  FirebaseStorageHelpers instance=FirebaseStorageHelpers();

  final FirebaseStorage _storage=FirebaseStorage.instance;


  Future<String> uploadImage(String userId,File image)async{
    TaskSnapshot taskSnapshot= _storage.ref(userId).putFile(image).snapshot;
   String imageUrl=await taskSnapshot.ref.getDownloadURL();

   return imageUrl;

  }




}