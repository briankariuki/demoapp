import 'package:cached_network_image/cached_network_image.dart';
import 'package:demoapp/assets.dart';
import 'package:demoapp/config/palette.dart';
import 'package:demoapp/models/models.dart';
import 'package:demoapp/screens/screens.dart';
import 'package:demoapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListingScreen extends StatefulWidget {
  final Listing listing;
  final int materialIndex;

  const ListingScreen({
    Key key,
    this.listing,
    this.materialIndex,
  }) : super(key: key);
  @override
  _ListingScreenState createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        key: PageStorageKey<String>("Details Page"),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            elevation: 0.0,
            expandedHeight: 240.0,
            pinned: true,
            leading: IconButton(
              icon: SvgPicture.asset(
                Assets.arrowLeft,
                color: Palette.primary,
                semanticsLabel: 'Arrow back',
                width: 24.0,
                height: 24.0,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            flexibleSpace: Stack(
              children: [
                Hero(
                  tag: widget.listing.imageUrl,
                  child: CachedNetworkImage(
                    imageUrl: widget.listing.imageUrl,
                    height: 300.0,
                    width: screenWidth,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 8,
                  child: Container(
                    margin: EdgeInsets.only(top: 24.0),
                    child: IconButton(
                      color: Colors.white,
                      icon: CircleAvatar(
                        radius: 14.0,
                        backgroundColor: Colors.white,
                        child: SvgPicture.asset(
                          Assets.arrowLeft,
                          color: Palette.black,
                          semanticsLabel: 'Arrow back',
                          width: 16.0,
                          height: 16.0,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 8,
                  child: Container(
                    margin: EdgeInsets.only(top: 24.0),
                    child: IconButton(
                      color: Colors.white,
                      icon: CircleAvatar(
                        radius: 14.0,
                        backgroundColor: Colors.white,
                        child: SvgPicture.asset(
                          Assets.arrowRight,
                          color: Palette.black,
                          semanticsLabel: 'Arrow forward',
                          width: 16.0,
                          height: 16.0,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 24.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.listing.title,
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: Palette.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20.0,
                                    ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Text(
                                "Description",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      color: Palette.primary,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                    ),
                              ),
                              const SizedBox(
                                width: 24.0,
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
                                    widget.listing.location,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                          color: Palette.gray4,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ksh ${widget.listing.price}",
                            style:
                                Theme.of(context).textTheme.headline3.copyWith(
                                      color: Palette.primary,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20.0,
                                    ),
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                Assets.clock,
                                color: Palette.gray4,
                                semanticsLabel: 'Clock Outline',
                                width: 20.0,
                                height: 20.0,
                              ),
                              const SizedBox(
                                width: 6.0,
                              ),
                              Text(
                                "Available",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      color: Palette.gray4,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    widget.listing.description,
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
                          showGeneralDialog(
                            barrierLabel: "Label",
                            barrierDismissible: true,
                            barrierColor: Colors.black.withOpacity(0.85),
                            transitionDuration: Duration(milliseconds: 100),
                            context: context,
                            pageBuilder: (context, anim1, anim2) {
                              return Align(
                                alignment: Alignment.center,
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SendRequestPopup(
                                        listing: widget.listing,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            transitionBuilder: (context, anim1, anim2, child) {
                              return FadeTransition(
                                opacity: Tween(begin: 0.0, end: 1.0)
                                    .chain(CurveTween(curve: Curves.ease))
                                    .animate(anim1),
                                child: ScaleTransition(
                                  scale: Tween(begin: 1.1, end: 1.0)
                                      .chain(CurveTween(
                                          curve: Curves.fastOutSlowIn))
                                      .animate(anim1),
                                  child: child,
                                ),
                              );
                            },
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
                        onTap: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  child: Text(
                    "About this shop",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Palette.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                  ),
                ),
                _AboutShopWidget(
                  icon: SvgPicture.asset(
                    Assets.badgeCheck,
                    color: Palette.primary,
                    semanticsLabel: 'badge check Outline',
                    width: 20.0,
                    height: 20.0,
                  ),
                  title: "Certified",
                ),
                const SizedBox(
                  height: 3.0,
                ),
                _AboutShopWidget(
                  icon: SvgPicture.asset(
                    Assets.clipBoardCheck,
                    color: Palette.primary,
                    semanticsLabel: 'clipboard Outline',
                    width: 20.0,
                    height: 20.0,
                  ),
                  title: "Registered",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _AboutShopWidget extends StatelessWidget {
  final String title;
  final Widget icon;

  const _AboutShopWidget({
    Key key,
    this.title,
    this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      color: Palette.primary.withOpacity(0.20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              icon,
              const SizedBox(
                width: 24.0,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Palette.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
              ),
            ],
          ),
          SvgPicture.asset(
            Assets.check,
            color: Palette.primary,
            semanticsLabel: 'check Outline',
            width: 20.0,
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
