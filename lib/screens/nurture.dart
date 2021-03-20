import 'package:flutter/material.dart';
import 'package:prerna/screens/home/newtestcase.dart';

class Nurture extends StatefulWidget {
  final data;
  final imei;

  const Nurture({Key key, this.data, this.imei}) : super(key: key);
  @override
  _NurtureState createState() => _NurtureState();
}

Color backgroundColor = Color.fromRGBO(130, 205, 113, 1);

class _NurtureState extends State<Nurture> {
  List<Data> dataList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataList.add(Data('assets/plants1.png', '5-10-10', 'plant1', '2-10-10', 1));
    dataList
        .add(Data('assets/plants2.png', '23-10-10', 'plant1', '21-10-10', 2));
    dataList.add(Data('assets/plants3.png', '1-10-10', 'plant1', '29-9-10', 5));
    dataList
        .add(Data('assets/plants4.png', '12-10-10', 'plant1', '9-10-10', 2));
    dataList
        .add(Data('assets/plants5.png', '13-10-10', 'plant1', '10-10-10', 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (builder, index) {
              return LimitedBox(
                maxHeight: 350,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Testcase(
                                  imei: widget.imei,
                                  no: widget.data.length,
                                )),
                      );
                    },
                    child: Container(
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.all(
                            const Radius.circular(10.0),
                          )),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              '${dataList[index].image}',
                              width: MediaQuery.of(context).size.width * 0.4,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 22, horizontal: 8),
                                  child: Text(
                                    'Nick Name : ${dataList[index].name}',
                                    style: TextStyle(
                                        fontFamily: 'BalsamiqSans_Blod',
                                        fontSize: 20,
                                        color: Colors.black),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 22),
                                  child: Row(
                                    children: [
                                      Text(
                                        ' Care Meter ',
                                        style: TextStyle(
                                            fontFamily: 'BalsamiqSans_Regular',
                                            fontSize: 18,
                                            color: Colors.black),
                                      ),
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.green,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.favorite_border,
                                        color: Colors.red,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.favorite_border,
                                        color: Colors.red,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.favorite_border,
                                        color: Colors.red,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.favorite_border,
                                        color: Colors.red,
                                        size: 15,
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 22),
                                  child: Text(
                                    ' Date Planted :${dataList[index].detail}',
                                    style: TextStyle(
                                        fontFamily: 'BalsamiqSans_Regular',
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 22),
                                  child: Text(
                                    ' Next Streak :${dataList[index].nimage}',
                                    style: TextStyle(
                                        fontFamily: 'BalsamiqSans_Regular',
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
    );
  }
}

class Data {
  String image;
  String nimage;
  String name;
  String detail;
  int type;

  Data(this.image, this.nimage, this.name, this.detail, this.type);
}
