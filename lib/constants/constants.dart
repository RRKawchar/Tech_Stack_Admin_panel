


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tech_stacks_admin_pannel/constants/colors.dart';

void showMessage({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: primaryColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Builder(
      builder: (context) {
        return SizedBox(
          width: 100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(
                color: primaryColor,
              ),
              const SizedBox(
                height: 18.0,
              ),
              Container(
                margin: const EdgeInsets.only(left: 8.0),
                child: const Text("Loading...."),
              )
            ],
          ),
        );
      },
    ),
  );

  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}

String getMessageFromErrorCode(String errorCode) {
  switch (errorCode) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
      return "Email already used. Go to login page";
    case "account-exists-with-different-credential":
      return "Email already used. Go to login page";
    case "email-already-in-use":
      return "Email already used. Go ot login page";
    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      return "Wrong password";
    case "ERROR_USER_NOT_FOUND":
      return "No user found with this email";
    case "user-not-found":
      return "No user found with this email";
    case "ERROR_USER_DISABLED":
      return "user disabled";
    case "user-disabled":
      return "User disabled";
    case "ERROR_TOO_MANY_REQUEST":
      return "To many request to log into this account";
    case "operation-not-allowed":
      return "To many request to log into this account";
    case "ERROR_OPERATION_NOT_ALLOWED":
      return "To many request to log into this account";
    case "ERROR_INVALID_EMAIL":
      return "Email address is invalid";
    case "invalid-email":
      return "Email address is invalid";
    default:
      return "Login failed. Please try again";
  }
}

bool loginValidation(String email, String password) {
  if (email.isEmpty && password.isEmpty) {
    showMessage(message: "Email & password is Empty");
    return false;
  } else if (email.isEmpty) {
    showMessage(message: "Email is Empty");
    return false;
  } else if (password.isEmpty) {
    showMessage(message: "password is Empty");
    return false;
  } else {
    return true;
  }
}

bool signUpValidation(String email, String password,String name,String phone) {
  if (email.isEmpty && password.isEmpty && name.isEmpty && phone.isEmpty) {
    showMessage(message: "All Fields are empty!!!!");
    return false;
  } else if (name.isEmpty) {
    showMessage(message: "name is Empty");
    return false;
  } else if (email.isEmpty) {
    showMessage(message: "email is Empty");
    return false;
  }
  else if (phone.isEmpty) {
    showMessage(message: "phone is Empty");
    return false;
  } else if (password.isEmpty) {
    showMessage(message: "password is Empty");
    return false;
  }else {
    return true;
  }
}
