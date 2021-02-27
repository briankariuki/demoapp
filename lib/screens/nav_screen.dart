import 'package:demoapp/assets.dart';
import 'package:demoapp/config/palette.dart';
import 'package:demoapp/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class NavScreenProvider with ChangeNotifier {
  int _selectedIndex = 0;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  int get selectedIndex => _selectedIndex;
}

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavScreenProvider(),
      child: Builder(
        builder: (context) {
          return Consumer<NavScreenProvider>(
            builder: (context, provider, child) {
              return DefaultTabController(
                length: 4,
                child: Scaffold(
                  body: IndexedStack(
                    index: provider.selectedIndex,
                    children: [
                      HomeScreen(),
                      Scaffold(),
                      Scaffold(),
                      Scaffold(),
                    ],
                  ),
                  bottomNavigationBar: Material(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            offset: new Offset(0.0, 0.0),
                            blurRadius: 20.0,
                          ),
                        ],
                      ),
                      height: 60.0,
                      child: CustomNavigationBar(
                        selectedIndex: provider.selectedIndex,
                        onTap: (int value) {
                          provider.setSelectedIndex(value);
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CustomNavigationBar extends StatelessWidget {
  final Function(int) onTap;
  final int selectedIndex;

  const CustomNavigationBar({
    Key key,
    this.onTap,
    this.selectedIndex,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _NavbarIconButton(
          onTap: () {
            onTap(0);
          },
          icon: SvgPicture.asset(
            Assets.home,
            color: selectedIndex == 0 ? Palette.primary : Palette.gray4,
            semanticsLabel: 'Home Outline',
            width: 28.0,
            height: 28.0,
          ),
        ),
        _NavbarIconButton(
          onTap: () {
            onTap(1);
          },
          icon: SvgPicture.asset(
            Assets.heart,
            color: selectedIndex == 1 ? Palette.primary : Palette.gray4,
            semanticsLabel: 'Heart Outline',
            width: 28.0,
            height: 28.0,
          ),
        ),
        IconButton(
          splashColor: Palette.primary.withOpacity(0.06),
          highlightColor: Palette.primary.withOpacity(0.08),
          iconSize: 50.0,
          icon: Container(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              Assets.plusCircle,
              color: Palette.black,
              semanticsLabel: 'Plus Circle Outline',
              width: 44.0,
              height: 44.0,
            ),
          ),
          onPressed: () {},
        ),
        _NavbarIconButton(
          onTap: () {
            onTap(2);
          },
          icon: SvgPicture.asset(
            Assets.chat,
            color: selectedIndex == 2 ? Palette.primary : Palette.gray4,
            semanticsLabel: 'Chat Outline',
            width: 28.0,
            height: 28.0,
          ),
        ),
        _NavbarIconButton(
          onTap: () {
            onTap(3);
          },
          icon: SvgPicture.asset(
            Assets.userCircle,
            color: selectedIndex == 3 ? Palette.primary : Palette.gray4,
            semanticsLabel: 'User Outline',
            width: 28.0,
            height: 28.0,
          ),
        ),
      ],
    );
  }
}

class _NavbarIconButton extends StatelessWidget {
  final Function onTap;
  final int selectedIndex;
  final int currentIndex;
  final Widget activeIcon;
  final Widget icon;
  const _NavbarIconButton({
    Key key,
    this.onTap,
    this.activeIcon,
    this.icon,
    this.selectedIndex,
    this.currentIndex,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Palette.primary.withOpacity(0.06),
      highlightColor: Palette.primary.withOpacity(0.08),
      iconSize: 50.0,
      icon: Container(
        width: 44.0,
        height: 44.0,
        alignment: Alignment.center,
        child: icon,
      ),
      onPressed: onTap,
    );
  }
}
