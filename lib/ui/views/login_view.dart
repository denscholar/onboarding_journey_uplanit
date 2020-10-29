import 'package:flutter/material.dart';
import 'package:uplanit_supplier/ui/views/base_view.dart';


class LoginView extends StatelessWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        builder: (context, model, child) => Scaffold(
          body: Container(
            child: Center(
              child: Text('Login View'),
            ),
          ),
        ),
    );
  }
}
