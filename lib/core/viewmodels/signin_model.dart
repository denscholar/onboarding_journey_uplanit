import 'package:flutter/material.dart';
import 'package:uplanit_supplier/validation/SigninValidate.dart';

class SigninValidation with ChangeNotifier {
  ValidationItem _emailAddress = ValidationItem(null, null);
  ValidationItem _passWord = ValidationItem(null, null);

  //getter
  ValidationItem get emailAddress => _emailAddress;
  ValidationItem get passWord => _passWord;
  bool get isValid {
    if (_emailAddress != null && _passWord != null) {
      return true;
    } else {
      return false;
    }
  }

  // setter

  void validateEmail(String value) {
    if (value.isEmpty == true) {
      _emailAddress = ValidationItem(value, null);
    } else {
      _emailAddress =
          ValidationItem(null, 'Please type in a valid email address');
    }
    notifyListeners();
  }

  void validatePword(String value) {
    if (value.isEmpty == true) {
      _passWord = ValidationItem(value, null);
    } else {
      _passWord = ValidationItem(value, 'Please type in your password');
    }
    notifyListeners();
  }

  void submitData() {
    print('Email: ${emailAddress.value}, Password: ${passWord.value},');
  }
}
