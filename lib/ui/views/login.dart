import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:uplanit_supplier/core/viewmodels/signin_model.dart';
import 'package:uplanit_supplier/ui/views/forgot_pwd.dart';
import 'package:uplanit_supplier/ui/views/sign_up.dart';
import 'package:uplanit_supplier/ui/widgets/custom_button.dart';
import 'package:uplanit_supplier/ui/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';


class Login extends StatelessWidget {
  static const String ROUTE = '/login';
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<SigninValidation>(context);

    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              SizedBox(height: 50),
              _buildText(),
              SizedBox(height: 20),
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'EMAIL',
                      style: GoogleFonts.workSans(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    CustomTextField(
                      onChange: (String value) {
                        validationService.validateEmail(value);
                      },
                      error: validationService.emailAddress.errors,
                      title: '',
                      color: Colors.black,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'PASSWORD',
                      style: GoogleFonts.workSans(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    CustomTextField(
                      onChange: (String value) {
                        validationService.validatePword(value);
                      },
                      error: validationService.passWord.errors,
                      title: '',
                      color: Colors.black,
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      isPassword: true,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => ForgotPwd());
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      title: 'LOG IN',
                      style: GoogleFonts.workSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      onPressed: (!validationService.isValid)
                          ? null
                          : validationService.submitData,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomLoginGF(
                      title: 'Sign in with Google',
                      images: 'assets/images/google.png',
                      style: GoogleFonts.workSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomLoginGF(
                      // onTap: googleSignIn(),
                      title: 'Sign in with Google',
                      images: 'assets/images/facebook.png',
                      style: GoogleFonts.workSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Image.asset(
              "assets/images/logo.png",
              height: 70.0,
            ),
          ),
          FlatButton(
            onPressed: () => Navigator.pushNamed(context, SignUp.ROUTE),
            child: Text(
              'Sign Up',
              style: GoogleFonts.workSans(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildText() {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Log in to continue',
              style: GoogleFonts.workSans(
                fontSize: 18.0,
                fontWeight: FontWeight.w300,
              ),
            )
          ]),
    );
  }

  // _buildForm() {
  //   TextEditingController _emailController = TextEditingController();
  //   TextEditingController _passwordController = TextEditingController();

  //   return Form(
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           'EMAIL',
  //           style: GoogleFonts.workSans(
  //             fontSize: 18.0,
  //             fontWeight: FontWeight.w500,
  //           ),
  //         ),
  //         CustomTextField(
  //           error: ,
  //           title: '',
  //           color: Colors.black,
  //           controller: _emailController,
  //           keyboardType: TextInputType.emailAddress,
  //         ),
  //         SizedBox(height: 20),
  //         Text(
  //           'PASSWORD',
  //           style: GoogleFonts.workSans(
  //             fontSize: 18.0,
  //             fontWeight: FontWeight.w500,
  //           ),
  //         ),
  //         CustomTextField(
  //           title: '',
  //           color: Colors.black,
  //           controller: _passwordController,
  //           keyboardType: TextInputType.text,
  //           isPassword: true,
  //         ),
  //         InkWell(
  //           onTap: () {},
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(vertical: 8.0),
  //             child: Text(
  //               'Forgot Password?',
  //               style: TextStyle(
  //                 fontSize: 16,
  //               ),
  //             ),
  //           ),
  //         ),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         CustomButton(
  //           title: 'LOG IN',
  //           style: GoogleFonts.workSans(
  //             fontSize: 20,
  //             fontWeight: FontWeight.w500,
  //             color: Colors.white,
  //           ),
  //           onPressed: () {},
  //         ),
  //         SizedBox(
  //           height: 5,
  //         ),
  //         CustomLoginGF(
  //           title: 'Sign in with Google',
  //           images: 'assets/images/google.png',
  //           style: GoogleFonts.workSans(
  //             fontSize: 20,
  //             fontWeight: FontWeight.w500,
  //             color: Colors.black,
  //           ),
  //         ),
  //         SizedBox(
  //           height: 5,
  //         ),
  //         CustomLoginGF(
  //           title: 'Sign in with Google',
  //           images: 'assets/images/facebook.png',
  //           style: GoogleFonts.workSans(
  //             fontSize: 20,
  //             fontWeight: FontWeight.w500,
  //             color: Colors.black,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

}

class AuthenticationService {
  FirebaseAuth firebaseAuth;

  AuthenticationService(this.firebaseAuth);

  Stream<User> get authStateChanges => firebaseAuth.authStateChanges();

  User get user => firebaseAuth.currentUser;
}



