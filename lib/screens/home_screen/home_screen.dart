import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_stacks_admin_pannel/constants/routes.dart';
import 'package:tech_stacks_admin_pannel/provider/app_provider.dart';
import 'package:tech_stacks_admin_pannel/screens/categories_view/categories_view.dart';
import 'package:tech_stacks_admin_pannel/screens/home_screen/components/single_cart_item.dart';
import 'package:tech_stacks_admin_pannel/screens/user_view/user_view_screen.dart';
import 'package:tech_stacks_admin_pannel/widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  void getData() async {
    setState(() {
      isLoading = true;
    });
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    await appProvider.callBackFunction();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Dashboard",
          fontWeight: FontWeight.bold,
          size: 20,
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 25,
                    ),
                    const CustomText(text: "Riyazur Rohman Kawchar"),
                    const CustomText(text: "riyazurrohmankawchar@gmail.com"),
                    GridView.count(
                      primary: false,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 12.0),
                      crossAxisCount: 2,
                      children: [
                        SingleCardItem(
                          count: appProvider.getUserList.length.toString(),
                          subtitle: 'Users',
                          onPressed: () {
                            Routes.push(
                                context: context, page: const UserViewScreen());
                          },
                        ),
                        SingleCardItem(
                          count:
                              appProvider.getCategoriesList.length.toString(),
                          subtitle: "Categories",
                          onPressed: () {
                            Routes.push(context: context, page: const CategoriesView());
                          },
                        ),
                        SingleCardItem(
                          count: "149",
                          subtitle: 'Products',
                          onPressed: () {},
                        ),
                        SingleCardItem(
                          count: "\$4000",
                          subtitle: 'Earning',
                          onPressed: () {},
                        ),
                        SingleCardItem(
                          count: "3",
                          subtitle: 'Pending Order',
                          onPressed: () {},
                        ),
                        SingleCardItem(
                          count: "44",
                          subtitle: 'Complete Order',
                          onPressed: () {},
                        ),
                        SingleCardItem(
                          count: "3",
                          subtitle: 'Cancel Order',
                          onPressed: () {},
                        ),
                        SingleCardItem(
                          count: "22",
                          subtitle: 'Delivery Order',
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
