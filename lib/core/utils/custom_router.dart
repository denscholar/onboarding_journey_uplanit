import 'package:flutter/material.dart';

import 'package:uplanit_supplier/ui/views/account_setup_one.dart';
import 'package:uplanit_supplier/ui/views/account_setup_two.dart';
import 'package:uplanit_supplier/ui/views/all_done.dart';
import 'package:uplanit_supplier/ui/views/launcher.dart';
import 'package:uplanit_supplier/ui/views/login.dart';
import 'package:uplanit_supplier/ui/views/sign_up.dart';
import 'package:uplanit_supplier/ui/views/sign_up_pager_finish.dart';
import 'package:uplanit_supplier/ui/views/sign_up_pager_one.dart';
import 'package:uplanit_supplier/ui/views/sign_up_pager_two.dart';

import '../../main.dart';

class CustomRouter {
  static Route<Widget> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AuthenticationWrapper.ROUTE:
        return MaterialPageRoute(builder: (_) => AuthenticationWrapper());
      case Launcher.ROUTE:
        return MaterialPageRoute(builder: (_) => Launcher());
      case Login.ROUTE:
        return MaterialPageRoute(builder: (_) => Login());
      case SignUp.ROUTE:
        return MaterialPageRoute(builder: (_) => SignUp());
      case SignUpPagerOne.ROUTE:
        return MaterialPageRoute(builder: (_) => SignUpPagerOne());
      case SignUpPagerTwo.ROUTE:
        return MaterialPageRoute(builder: (_) => SignUpPagerTwo());
      case SignUpPagerFinish.ROUTE:
        return MaterialPageRoute(builder: (_) => SignUpPagerFinish());
      case AccountSetupOne.ROUTE:
        return MaterialPageRoute(builder: (_) => AccountSetupOne());
      case AccountSetupTwo.ROUTE:
        return MaterialPageRoute(builder: (_) => AccountSetupTwo());
      case AllDone.ROUTE:
        return MaterialPageRoute(builder: (_) => AllDone());
      default:
        return null;
    }
  }
}
