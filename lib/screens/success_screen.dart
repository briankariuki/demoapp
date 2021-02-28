import 'package:demoapp/assets.dart';
import 'package:demoapp/config/palette.dart';
import 'package:demoapp/models/models.dart';
import 'package:demoapp/screens/screens.dart';
import 'package:demoapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessScreen extends StatefulWidget {
  final Listing listing;

  const SuccessScreen({
    Key key,
    this.listing,
  }) : super(key: key);
  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.successArt,
                semanticsLabel: 'Success Art ',
                width: 300.0,
                height: 300.0,
              ),
              const SizedBox(
                height: 36.0,
              ),
              Text(
                "Request sent succesfully",
                style: Theme.of(context).textTheme.headline3.copyWith(
                      color: Palette.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 24.0,
                    ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                width: screenWidth / 1.2,
                child: Text(
                  "Please wait for confirmation then proceed to payment.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Palette.gray2,
                      ),
                ),
              ),
              const SizedBox(
                height: 36.0,
              ),
              MainButton(
                color: Palette.primary,
                textColor: Colors.white,
                height: 52.0,
                title: "Go Back Home",
                minWidth: screenWidth / 2,
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
