import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uplanit_supplier/core/utils/custom_colors.dart';
import 'package:uplanit_supplier/ui/widgets/custom_indicators.dart';

import 'launcher.dart';


class AllDone extends StatefulWidget {
  static const String ROUTE = '/allDone';
  const AllDone({Key key}) : super(key: key);

  @override
  _AllDoneState createState() => _AllDoneState();
}

class _AllDoneState extends State<AllDone> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 5000), () {
      setState(() {
        Navigator.pushNamed(
          context,
          Launcher.ROUTE,
        );
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'All done!',
                    style: GoogleFonts.workSans(
                      color: CustomColor.primaryColor,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () => Navigator.pushNamed(
                      context,
                      Launcher.ROUTE,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: CustomColor.primaryColor,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Image.asset(
                          "assets/images/send.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
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
          ),
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
          BorderedDot(
            color: CustomColor.primaryColor,
          ),
          SizedBox(width: 2),
          SimpleLine(
            color: CustomColor.primaryColor,
          ),
          SizedBox(width: 2),
          BorderedDot(
            color: CustomColor.primaryColor,
          ),
          SizedBox(width: 2),
          SimpleLine(
            color: CustomColor.primaryColor,
          ),
          SizedBox(width: 2),
          BorderedDot(
            color: CustomColor.primaryColor,
          ),
        ],
      ),
    );
  }

  _borderedDot() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: CustomColor.primaryColor,
        ),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: _simpleDot(isActive: true),
      ),
    );
  }

  _simpleDot({bool isActive = false}) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive ? CustomColor.primaryColor : Colors.pink.shade300,
        shape: BoxShape.circle,
      ),
    );
  }

  _line() {
    return Container(
      width: 50,
      height: 1,
      decoration: BoxDecoration(
        color: CustomColor.primaryColor,
      ),
    );
  }
}
