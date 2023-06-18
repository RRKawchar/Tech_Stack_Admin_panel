import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_stacks_admin_pannel/constants/colors.dart';
import 'package:tech_stacks_admin_pannel/models/category_model/categories_model.dart';
import 'package:tech_stacks_admin_pannel/provider/app_provider.dart';
import 'package:tech_stacks_admin_pannel/widgets/custom_network_image.dart';

class CategoryCardItem extends StatefulWidget {
  final CategoriesModel categoriesModel;
  const CategoryCardItem({Key? key, required this.categoriesModel})
      : super(key: key);

  @override
  State<CategoryCardItem> createState() => _CategoryCardItemState();
}

class _CategoryCardItemState extends State<CategoryCardItem> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Card(
      elevation: 8,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        children: [
          SizedBox(
              child: Center(
            child: CustomNetWorkImage(
              image: widget.categoriesModel.image.toString(),
              height: 100,
              width: 100,
            ),
          )),
          Positioned(
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IgnorePointer(
                    ignoring: isLoading,
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await appProvider
                            .deleteCategory(widget.categoriesModel);
                        setState(() {
                          isLoading = false;
                        });
                      },
                      child: isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.edit,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
