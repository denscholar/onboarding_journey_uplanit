import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uplanit_supplier/core/utils/custom_colors.dart';
import 'package:uplanit_supplier/ui/widgets/custom_indicators.dart';
import 'package:uplanit_supplier/ui/widgets/custom_textarea.dart';
import 'package:uplanit_supplier/ui/widgets/custom_textfield.dart';

import 'account_setup_two.dart';

class AccountSetupOne extends StatelessWidget {
  static const String ROUTE = '/accountSetupOne';
  const AccountSetupOne({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context),
                    SizedBox(height: 20),
                    Container(
                      child: Text(
                        'Tell us about \nyour business',
                        style: GoogleFonts.workSans(
                          color: Colors.white,
                          fontSize: 28.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildForm(),
                    //  Expanded(child: Container()),
                  ],
                ),
              ),
            ),
          ),
          _buildIndicator(),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, AccountSetupTwo.ROUTE);
              },
              child: Center(
                child: Text(
                  'Next',
                  style: GoogleFonts.workSans(
                    fontSize: 22.0,
                    color: CustomColor.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildHeader(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 12),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildForm() {
    TextEditingController _businessNameController = TextEditingController();
    TextEditingController _describeController = TextEditingController();
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'BUSINESS NAME',
            style: GoogleFonts.workSans(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          CustomTextField(
            title: '',
            color: Colors.white,
            controller: _businessNameController,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 20),
          Text(
            'DESCRIBE YOUR BUSINESS',
            style: GoogleFonts.workSans(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          CustomTextArea(
            title: '',
            color: Colors.white,
            controller: _describeController,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  _buildIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BorderedDot(),
          SizedBox(width: 2),
          SimpleLine(),
          SizedBox(width: 2),
          BorderedDot(),
          SizedBox(width: 2),
          SimpleLine(),
          SizedBox(width: 2),
          SimpleDot(),
        ],
      ),
    );
  }
}
