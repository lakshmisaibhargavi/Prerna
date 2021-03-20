import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:prerna/screens/home/Newplant.dart';
import 'package:prerna/screens/myplant.dart';
import 'package:prerna/screens/nurture.dart';
import 'package:prerna/screens/plantpay.dart';

import 'navbar.dart';

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

Color backgroundColor = Color.fromRGBO(130, 205, 113, 1);

class _MainWidgetState extends State<MainWidget> {
  @override
  void initState() {
    super.initState();
    getid();
  }

  bool busy = true;
  String id;
  int np = 0;
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
      Myplant(
        data: data,
        imei: id,
      ),
      Nurture(
        imei: id,
        data: data,
      ),
      Plantpay(
        data: data,
        imei: id,
      )
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
                            icon: 'assets/ns.png', name: 'NEW PLANT'),

                        /// Likes
                        DotNavigationBarItem(
                            icon: 'assets/np.png', name: 'MY PLANTS'),

                        /// Search
                        DotNavigationBarItem(
                            icon: 'assets/nw.png', name: 'NURTURE'),

                        /// Profile
                        DotNavigationBarItem(
                            icon: 'assets/PB.png', name: 'PLANT BANK'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        : Scaffold(
            backgroundColor: Colors.green,
            body: Center(child: CircularProgressIndicator()),
          );
  }
}
