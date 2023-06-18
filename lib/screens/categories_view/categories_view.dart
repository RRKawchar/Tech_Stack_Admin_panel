import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_stacks_admin_pannel/models/category_model/categories_model.dart';
import 'package:tech_stacks_admin_pannel/provider/app_provider.dart';
import 'package:tech_stacks_admin_pannel/screens/categories_view/components/category_card_item.dart';
import 'package:tech_stacks_admin_pannel/widgets/custom_text.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Categories View",size: 20,
        ),
        centerTitle: true,
      ),
      body: Consumer<AppProvider>(
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: "Categories",
                    size: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: value.getCategoriesList.length,
                      itemBuilder: (context, index) {
                        CategoriesModel categoriesModel =
                            value.getCategoriesList[index];
                        return CategoryCardItem(categoriesModel: categoriesModel);
                        // return SingleUserCardItem(index: index,userModel: categoriesModel);
                      }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
