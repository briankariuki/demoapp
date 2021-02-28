import 'package:demoapp/assets.dart';
import 'package:demoapp/config/palette.dart';
import 'package:demoapp/models/listing_model.dart';
import 'package:demoapp/screens/screens.dart';
import 'package:demoapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SendRequestPopup extends StatelessWidget {
  final Listing listing;

  const SendRequestPopup({
    Key key,
    this.listing,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      decoration: BoxDecoration(
        color: Palette.primary,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Text(
              "Send Request ?",
              style: Theme.of(context).textTheme.headline3.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                  ),
            ),
          ),
          Divider(
            thickness: 1.5,
            height: 2.0,
            color: Colors.white.withOpacity(0.3),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              children: [
                Text(
                  "You are about to request for this service. Do You want to proceed?",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MainButton(
                      color: Colors.white.withOpacity(0.40),
                      textColor: Colors.white,
                      height: 48.0,
                      title: "Cancel",
                      minWidth: screenWidth / 2.7,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    MainButton(
                      color: Colors.white,
                      textColor: Palette.black,
                      height: 48.0,
                      title: "Confirm",
                      minWidth: screenWidth / 2.7,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SuccessScreen(
                              listing: listing,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
