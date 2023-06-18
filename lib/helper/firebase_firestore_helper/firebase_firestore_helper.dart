// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tech_stacks_admin_pannel/constants/constants.dart';
import 'package:tech_stacks_admin_pannel/models/category_model/categories_model.dart';
import 'package:tech_stacks_admin_pannel/models/user_model/user_model.dart';

class FirebaseFireStoreHelper {
  static FirebaseFireStoreHelper instance = FirebaseFireStoreHelper();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Users Methods

  Future<List<UserModel>> getUserList() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _firestore.collection('users').get();
    return querySnapshot.docs.map((e) => UserModel.fromJson(e.data())).toList();
  }


  Future<String> deleteSingleUser(String id) async {
    try {
      await _firestore.collection('users').doc(id).delete();
      return "Delete Successfully";
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> updateUser(UserModel userModel) async {
    try {
      await _firestore.collection('users').doc(userModel.id).update(userModel.toJson());
    } catch (e) {}
  }
/// Categories methods

  Future<List<CategoriesModel>> getCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await _firestore.collection('categories').get();

      List<CategoriesModel> categoriesList = querySnapshot.docs
          .map((e) => CategoriesModel.fromJson(e.data()))
          .toList();

      return categoriesList;
    } catch (e) {
      showMessage(message: e.toString());
      return [];
    }
  }

  Future<String> deleteCategory(String id) async {
    try {
       await _firestore.collection('categories').doc(id).delete();
      return "Delete Successfully";
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> updateCategory(CategoriesModel categoriesModel) async {
    try {
      await _firestore.collection('categories').doc(categoriesModel.id).update(categoriesModel.toJson());
    } catch (e) {}
  }
}
