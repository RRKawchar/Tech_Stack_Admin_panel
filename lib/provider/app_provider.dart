import 'package:flutter/cupertino.dart';
import 'package:tech_stacks_admin_pannel/constants/constants.dart';
import 'package:tech_stacks_admin_pannel/helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import 'package:tech_stacks_admin_pannel/models/category_model/categories_model.dart';
import 'package:tech_stacks_admin_pannel/models/user_model/user_model.dart';

class AppProvider with ChangeNotifier {
  List<UserModel> _userList = [];
  List<CategoriesModel> _categoriesList = [];

  List<UserModel> get getUserList => _userList;
  List<CategoriesModel> get getCategoriesList => _categoriesList;

  Future<void> getUsers() async {
    _userList = await FirebaseFireStoreHelper.instance.getUserList();
  }



  Future<void> deleteUser(UserModel userModel) async {
    notifyListeners();
    String value =
        await FirebaseFireStoreHelper.instance.deleteSingleUser(userModel.id);

    if (value == "Delete Successfully") {
      _userList.remove(userModel);
      showMessage(message: 'Delete Successfully');
    }

    notifyListeners();
  }

  Future<void> callBackFunction() async {
    await getUsers();
    await getCategories();
  }

  void updateUser(int index,UserModel userModel)async{
    await FirebaseFireStoreHelper.instance.updateUser(userModel);
    _userList[index]=userModel;
    notifyListeners();

  }

  /// categories provider

  Future<void> getCategories() async {
    _categoriesList = await FirebaseFireStoreHelper.instance.getCategories();
  }


  Future<void> deleteCategory(CategoriesModel categoriesModel) async {
    notifyListeners();
    String value =
     await FirebaseFireStoreHelper.instance.deleteSingleUser(categoriesModel.id);

    if (value == "Delete Successfully") {
      _categoriesList.remove(categoriesModel);
      showMessage(message: 'Delete Successfully');
    }

    notifyListeners();
  }

  void updateCategory(int index,CategoriesModel categoriesModel)async{
    await FirebaseFireStoreHelper.instance.updateCategory(categoriesModel);
    _categoriesList[index]=categoriesModel;
    notifyListeners();

  }
}
