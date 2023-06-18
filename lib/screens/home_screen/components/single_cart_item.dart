import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_stacks_admin_pannel/widgets/custom_text.dart';

class SingleCardItem extends StatelessWidget {
  final String count,subtitle;
  final void Function()? onPressed;
  const SingleCardItem({Key? key, required this.count, required this.subtitle, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Card(
        child: Container(
             width: double.infinity,
          color: Theme.of(context).primaryColor.withOpacity(0.5),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(text: count,size: 30,),
              CustomText(text:subtitle,size: 20,),
            ],
          ),
        ),
      ),
    );;
  }
}
