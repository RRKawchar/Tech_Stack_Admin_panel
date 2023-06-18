import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_stacks_admin_pannel/constants/colors.dart';
import 'package:tech_stacks_admin_pannel/constants/routes.dart';
import 'package:tech_stacks_admin_pannel/models/user_model/user_model.dart';
import 'package:tech_stacks_admin_pannel/provider/app_provider.dart';
import 'package:tech_stacks_admin_pannel/screens/user_view/edit_user/edit_user.dart';
import 'package:tech_stacks_admin_pannel/widgets/custom_network_image.dart';
import 'package:tech_stacks_admin_pannel/widgets/custom_text.dart';

class SingleUserCardItem extends StatefulWidget {
  final UserModel userModel;
  final int index;
  const SingleUserCardItem({Key? key, required this.userModel, required this.index}) : super(key: key);

  @override
  State<SingleUserCardItem> createState() => _SingleUserCardItemState();
}

class _SingleUserCardItemState extends State<SingleUserCardItem> {
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
           widget.userModel.image.isNotEmpty
                ? CustomNetWorkImage(
                image: widget.userModel.image.toString(),
                height: 30,
                width: 30)
                : const CircleAvatar(
              radius: 20,
              child: Icon(Icons.person),
            ),
            const SizedBox(
              width: 12.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text:widget.userModel.name.isEmpty?'': widget.userModel.name),
                CustomText(text: widget.userModel.email.toString()),
              ],
            ),
            const Spacer(),
           isLoading
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : GestureDetector(
                onTap: () async {
                  setState(() {
                    isLoading=true;
                  });
                  await appProvider.deleteUser(widget.userModel);
                  setState(() {
                    isLoading=false;
                  });
                },
                child: const Icon(
                  Icons.delete,
                  color: primaryColor,
                )),
            const SizedBox(width: 8.0,),
            GestureDetector(
                onTap: () async {
                Routes.push(context: context, page: EditProfile(index:widget.index ,userModel: widget.userModel));
                },
                child: const Icon(
                  Icons.edit,
                  color: Colors.black,
                )),
          ],
        ),
      ),
    );
  }
}
