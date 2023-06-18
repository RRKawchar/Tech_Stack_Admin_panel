import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_stacks_admin_pannel/models/user_model/user_model.dart';
import 'package:tech_stacks_admin_pannel/provider/app_provider.dart';
import 'package:tech_stacks_admin_pannel/screens/user_view/components/single_user_card_item.dart';
import 'package:tech_stacks_admin_pannel/widgets/custom_text.dart';

class UserViewScreen extends StatelessWidget {
  const UserViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "User View",
        ),
      ),
      body: Consumer<AppProvider>(
        builder: (context, value, child) {
          return ListView.builder(
              itemCount: value.getUserList.length,
              itemBuilder: (context, index) {
                UserModel userModel = value.getUserList[index];

                return SingleUserCardItem(index: index,userModel: userModel);
              });
        },
      ),
    );
  }
}
