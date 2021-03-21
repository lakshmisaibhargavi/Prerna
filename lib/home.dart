import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import 'dash.dart';
import 'menu.dart';

class Dashboard extends StatefulWidget {
  final type;

  const Dashboard({Key key, this.type}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

Color backgroundColor = Colors.blue.shade200;

class _DashboardState extends State<Dashboard> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  String title = "PlantPay";
  @override
  Widget build(BuildContext context) {
    GlobalKey<SliderMenuContainerState> _key =
        new GlobalKey<SliderMenuContainerState>();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SliderMenuContainer(
          appBarColor: backgroundColor,
          key: _key,
          appBarPadding: const EdgeInsets.only(top: 20),
          appBarHeight: 100,
          title: Image.asset('assets/logo.png'),
          sliderMenu: MenuWidget(),
          sliderMain: MainWidget()),
    );
  }
}

enum _SelectedTab { home, favorite, search, person }
