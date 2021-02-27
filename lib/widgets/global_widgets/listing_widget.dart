import 'package:cached_network_image/cached_network_image.dart';
import 'package:demoapp/assets.dart';
import 'package:demoapp/config/palette.dart';
import 'package:demoapp/models/models.dart';
import 'package:demoapp/screens/screens.dart';
import 'package:demoapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListingWidget extends StatelessWidget {
  final Listing listing;

  const ListingWidget({
    Key key,
    this.listing,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: listing.imageUrl,
          height: screenHeight / 3,
          width: screenWidth,
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 24.0,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        listing.title,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Palette.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0,
                            ),
                      ),
                      Text(
                        "Ksh ${listing.price}",
                        style: Theme.of(context).textTheme.headline3.copyWith(
                              color: Palette.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 24.0,
                            ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.location,
                        color: Palette.gray4,
                        semanticsLabel: 'Location Outline',
                        width: 20.0,
                        height: 20.0,
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        listing.location,
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Palette.gray4,
                            ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                listing.smallDescription,
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: Palette.gray3,
                    ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainIconButton(
                    color: Palette.primary.withOpacity(0.20),
                    textColor: Palette.primary,
                    height: 48.0,
                    title: "Request",
                    minWidth: screenWidth / 2.3,
                    icon: SvgPicture.asset(
                      Assets.shoppingCart,
                      color: Palette.primary,
                      semanticsLabel: 'Location Outline',
                      width: 20.0,
                      height: 20.0,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NavScreen()),
                      );
                    },
                  ),
                  MainIconButton(
                    color: Palette.primary,
                    textColor: Colors.white,
                    height: 48.0,
                    title: "Call",
                    minWidth: screenWidth / 2.3,
                    icon: SvgPicture.asset(
                      Assets.phone,
                      color: Colors.white,
                      semanticsLabel: 'Call Outline',
                      width: 20.0,
                      height: 20.0,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NavScreen()),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
