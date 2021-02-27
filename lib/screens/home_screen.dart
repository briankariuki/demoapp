import 'package:demoapp/assets.dart';
import 'package:demoapp/config/palette.dart';
import 'package:demoapp/data/listing_data.dart';
import 'package:demoapp/models/models.dart';
import 'package:demoapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Listing> listings = [];
  @override
  void initState() {
    loadListings();
    super.initState();
  }

  void loadListings() {
    listings = listingData.map<Listing>((e) => Listing.fromMap(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        key: PageStorageKey<String>("Home Page"),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            elevation: 0.0,
            pinned: true,
            leading: IconButton(
              icon: SvgPicture.asset(
                Assets.arrowLeft,
                color: Palette.black,
                semanticsLabel: 'Arrow back',
                width: 24.0,
                height: 24.0,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              "Search in Nails",
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Palette.black,
                  ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: Container(
                margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10.0),
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Palette.gray7,
                  borderRadius: BorderRadius.circular(6.0),
                  border: Border.all(
                    width: 0.5,
                    color: Palette.gray4,
                  ),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: SvgPicture.asset(
                      Assets.search,
                      color: Palette.gray4,
                      semanticsLabel: 'Seaarch Outline',
                      width: 24.0,
                      height: 24.0,
                    ),
                    border: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Palette.gray3,
                        ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final Listing listingItem = listings[index];
                return ListingWidget(
                  listing: listingItem,
                  // playerElementFixtureItem: playerElementFixtureItem,
                  // screenWidth: widget.screenWidth,
                );
              },
              childCount: listings.length,
            ),
          )
        ],
      ),
    );
  }
}
