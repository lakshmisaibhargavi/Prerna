import 'dart:convert';

import 'package:prerna/bag.dart';
import 'package:prerna/navbar.dart';

import 'package:http/http.dart' as http;
import 'package:prerna/screens/home/Newplant.dart';
import 'package:prerna/screens/myplant.dart';

import 'package:prerna/screens/nurture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:prerna/screens/profile.dart';

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

Color backgroundColor = Colors.blue.shade200;

class _MainWidgetState extends State<MainWidget> {
  @override
  void initState() {
    super.initState();
    getid();
  }

  bool busy = true;
  String id;
  int np = 2;
  var data = {};
  Future<void> getid() async {
    var extracted;
    id = await ImeiPlugin.getImei();
    print(id);
    extracted = await http
        .get('https://plantpay-4c635-default-rtdb.firebaseio.com/plants.json');

    print(json.decode(extracted.body));
    if (json.decode(extracted.body) == null) {
      await http
          .patch(
              'https://plantpay-4c635-default-rtdb.firebaseio.com/plants.json',
              body: json.encode({'test': 'test'}))
          .then((value) async {
        extracted = await http.get(
          'https://plantpay-4c635-default-rtdb.firebaseio.com/plants.json',
        );
      });
    }

    setState(() {
      data = json.decode(extracted.body);
      /*if (data.length == null) {
        np = 0;
      } else {
        np = data.length - 1;
      }*/

      busy = false;
    });
  }

  int _selectedTab = 0;
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    List values = [
      Newplant(
        data: data,
        imei: id,
      ),
      Mybag(
        data: data,
        imei: id,
      ),
      Nurture(
        imei: id,
        data: data,
      ),
      Profile()
    ];
    List<Color> colors = [
      backgroundColor,
      backgroundColor,
      backgroundColor,
      backgroundColor
    ];
    PageController controller = PageController();
    void _handleIndexChanged(int i) {
      setState(() {
        _selectedTab = i;
        controller.jumpToPage(i);
      });
    }

    return !busy
        ? Scaffold(
            body: Stack(
              children: [
                PageView.builder(
                  itemCount: colors.length,
                  scrollDirection: Axis.horizontal,
                  controller: controller,
                  onPageChanged: (value) {
                    setState(() {
                      print(value);
                      _selectedTab = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    return values[index];
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    child: DotNavigationBar(
                      currentIndex: _selectedTab,
                      onTap: _handleIndexChanged,
                      items: [
                        /// Home
                        DotNavigationBarItem(
                            icon: 'assets/np.png', name: 'MY PLANT'),

                        /// Likes
                        DotNavigationBarItem(
                            icon: 'assets/bag.png', name: 'MY BAG'),

                        /// Search
                        DotNavigationBarItem(
                            icon: 'assets/home.png', name: 'HOME'),

                        /// Profile
                        DotNavigationBarItem(
                            icon: 'assets/user.png', name: 'PROFILE'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        : Scaffold(
            backgroundColor: Colors.blue.shade200,
            body: Center(child: CircularProgressIndicator()),
          );
  }
}
