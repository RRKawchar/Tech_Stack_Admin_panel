// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tech_stacks_admin_pannel/constants/constants.dart';
import 'package:tech_stacks_admin_pannel/helper/firebase_storage_helper/firebase_storage_helpers.dart';
import 'package:tech_stacks_admin_pannel/models/category_model/categories_model.dart';
import 'package:tech_stacks_admin_pannel/models/user_model/user_model.dart';
import 'package:tech_stacks_admin_pannel/provider/app_provider.dart';
import 'package:tech_stacks_admin_pannel/widgets/custom_text.dart';

class EditCategory extends StatefulWidget {
  final CategoriesModel categoriesModel;
  final int index;
  const EditCategory({Key? key, required this.categoriesModel, required this.index}) : super(key: key);

  @override
  State<EditCategory> createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {

  final ImagePicker _picker=ImagePicker();
  File? image;
  void pickImage()async{
    XFile? file=await _picker.pickImage(source: ImageSource.gallery);
    if(file!=null){
      setState(() {
        image=File(file.path);
      });
    }
  }

  TextEditingController nameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    AppProvider provider=Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title:  const CustomText(text: "Profile",),
        centerTitle: true,
      ),
      body: ListView(
        padding:  const EdgeInsets.symmetric(horizontal: 20.0),
        children:  [
          image==null? InkWell(
            onTap: (){
              pickImage();
            },
            child: const CircleAvatar(
              radius: 70,
              child: Icon(Icons.camera_alt,size: 35,),
            ),
          ):InkWell(
            onTap: (){
              pickImage();
            },
            child: CircleAvatar(
              radius: 70,
              backgroundImage: FileImage(image!),
            ),
          ),
          const SizedBox(height: 25.0,),
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
                hintText:widget.categoriesModel.name
            ),
          ),
          const SizedBox(height: 12.0,),
          ElevatedButton(
              onPressed: ()async{
                if(image==null && nameController.text.isEmpty){

                  Navigator.of(context).pop();
                }
                else if(image != null){
                  String imageUrl=await FirebaseStorageHelpers.instance.uploadImage(widget.categoriesModel.id,image!);
                  CategoriesModel categoriesModel= widget.categoriesModel.copyWith(
                      image: imageUrl,
                      name: nameController.text.isEmpty?null:nameController.text
                  );

                  provider.updateCategory(widget.index,categoriesModel);
                  showMessage(message: "Update successfully");
                }else{

                  CategoriesModel categoriesModel= widget.categoriesModel.copyWith(
                      name: nameController.text.isEmpty?null:nameController.text
                  );

                  provider.updateCategory(widget.index,categoriesModel);
                  showMessage(message: "Update successfully");
                }
                Navigator.of(context).pop();

              },
              child: const CustomText(text: 'Update',))
        ],
      ),
    );
  }
}