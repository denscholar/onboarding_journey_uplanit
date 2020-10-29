import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uplanit_supplier/core/services/authentication_service.dart';
import 'package:uplanit_supplier/core/viewmodels/signin_model.dart';
import 'package:uplanit_supplier/ui/views/launcher.dart';
// import 'package:uplanit_supplier/ui/views/sign_up.dart';
// import 'package:uplanit_supplier/ui/views/sign_up_pager_two.dart';
// import 'core/models/onboard.dart';
import 'core/utils/custom_router.dart';
import 'core/viewmodels/signup_model.dart';

Future<void> main() async {
  print('firebase initilizing');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print('firebase initialized');
  // setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        ChangeNotifierProvider(
          create: (_) => SignUpModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => SigninValidation(),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        ),
        // StreamProvider<Onboard>(create: (context) => cont)
      ],
      child: MaterialApp(
        title: 'Uplanit Supplier',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthenticationWrapper(),
        onGenerateRoute: CustomRouter.onGenerateRoute,
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  static const String ROUTE = '/';
  const AuthenticationWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    return firebaseUser == null
        ? Launcher()
        : Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Authenticated'),
                Text(
                  firebaseUser.displayName,
                  style: GoogleFonts.workSans(
                    fontSize: 22,
                  ),
                ),
                FlatButton(
                  onPressed: () async =>
                      await context.read<AuthenticationService>().logout(),
                  child: Text(
                    'Logout',
                    style: GoogleFonts.workSans(
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
