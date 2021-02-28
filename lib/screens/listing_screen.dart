import 'package:demoapp/models/models.dart';
import 'package:flutter/material.dart';

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
    return Scaffold();
  }
}
