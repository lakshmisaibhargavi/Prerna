import 'package:flutter/material.dart';
import 'package:prerna/screens/home/addplant.dart';
import 'package:prerna/vr.dart';

class Mybag extends StatefulWidget {
  final imei;
  final data;

  const Mybag({Key key, this.imei, this.data}) : super(key: key);
  @override
  _MybagState createState() => _MybagState();
}

class _MybagState extends State<Mybag> {
  List<Data> dataList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataList.add(Data('assets/vr1.jpg', '10-10-10', 'shrubs'));
    dataList.add(Data('assets/vr2.png', '10-10-10', 'shrubs'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: Text(
                'My Vr/AR Locations',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (builder, index) {
                  return GestureDetector(
                    onTap: () {
                      print('vr');

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Vrpage(
                              img: dataList[index].image,
                            ),
                          ));
                    },
                    child: LimitedBox(
                      maxHeight: 200,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
                        child: Container(
                            decoration: new BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('${dataList[index].image}')),
                                color: Colors.white,
                                borderRadius: new BorderRadius.all(
                                  const Radius.circular(10.0),
                                )),
                            child: Stack(
                              children: [],
                            )),
                      ),
                    ),
                  );
                },
                separatorBuilder: (builder, index) {
                  return Divider(
                    height: 10,
                    thickness: 0,
                  );
                },
                itemCount: dataList.length),
          ),
        ],
      ),
    );
  }
}

class Data {
  String image;
  String name;
  String type;

  Data(this.image, this.name, this.type);
}
