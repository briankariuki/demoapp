import 'dart:async';

import 'package:demoapp/config/palette.dart';
import 'package:demoapp/config/theme.dart';
import 'package:demoapp/screens/screens.dart';
import 'package:demoapp/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/Inter OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    final license2 =
        await rootBundle.loadString('assets/fonts/Poppins OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license2);
  });

  runZonedGuarded(() {
    runApp(MyApp());
  }, (error, stackTrace) {
    print('runZonedGuarded: Caught error in my root zone.');
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Palette.primary,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                "Demo App",
                style: Theme.of(context).textTheme.headline3.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 36.0,
                    ),
              ),
            ),
            Positioned(
              bottom: 60.0,
              right: 0.0,
              left: 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MainButton(
                    color: Colors.white.withOpacity(0.25),
                    textColor: Colors.white,
                    height: 52.0,
                    title: "Explore",
                    minWidth: screenWidth / 2,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NavScreen()),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
