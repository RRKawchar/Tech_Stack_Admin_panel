
import 'package:flutter/material.dart';
import 'package:tech_stacks_admin_pannel/constants/colors.dart';

ThemeData themeData=ThemeData(
  primaryColor: Colors.indigo,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        padding:  const EdgeInsets.symmetric(horizontal: 20),
        side:  const BorderSide(
            color: primaryColor
        )
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    suffixIconColor: Colors.grey,
    prefixIconColor: Colors.grey,
    border:outlineInputBorder,
    focusedBorder: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    errorBorder: outlineInputBorder,
    disabledBorder: outlineInputBorder
  ),

  scaffoldBackgroundColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.indigo,
      textStyle:const TextStyle(fontSize: 18.0),
      disabledBackgroundColor: Colors.grey
    )
  ),
  canvasColor: primaryColor,
  primarySwatch: Colors.indigo,
  appBarTheme: const AppBarTheme(
    toolbarTextStyle: TextStyle(color: Colors.black),
    backgroundColor: Colors.white,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.black
    )
  )
);




OutlineInputBorder outlineInputBorder=const OutlineInputBorder(
    borderSide: BorderSide(
        color: Colors.grey
    )
);