import 'package:flutter/cupertino.dart';
import 'package:uplanit_supplier/core/enums/view_state.dart';

class SignUpModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;
  bool _showPassword = false;
  String _displayName = "";
  String _uid = "";

  String get uid => _uid;
  String get displayName => _displayName;
  bool get showPassword => _showPassword;
  ViewState get state => _state;

  void togglePassword() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  setState(ViewState state) {
    _state = state;
    notifyListeners();
  }

  setDisplayName(String displayName) {
    _displayName = displayName;
    notifyListeners();
  }

  setUid(String uid){
    _uid = uid;
    notifyListeners();
  }
}
