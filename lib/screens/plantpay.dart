import 'package:flutter/material.dart';
import 'package:prerna/screens/home/Newplant.dart';

class Plantpay extends StatefulWidget {
  final imei;
  final data;

  const Plantpay({Key key, this.imei, this.data}) : super(key: key);
  @override
  _PlantpayState createState() => _PlantpayState();
}

class _PlantpayState extends State<Plantpay> {
  List<Data> dataList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataList.add(
        Data('assets/Apple bees.png', '5-10-10', 'Apple bees', '2-10-10', 1));
    dataList.add(
        Data('assets/Air-india.png', '23-10-10', 'Air-india', '21-10-10', 2));
    dataList.add(Data('assets/Ahold.png', '1-10-10', 'Ahobe', '29-9-10', 5));
    dataList.add(Data('assets/aa.png', '12-10-10', '7-11', '9-10-10', 2));
    dataList.add(Data('assets/abc logo.png', '13-10-10', 'ABC', '10-10-10', 1));
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
                  child: Container(
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.all(
                          const Radius.circular(10.0),
                        )),
                    child: Row(
                      children: [
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
                                  'Company Name : ${dataList[index].name}',
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
                                      ' Length : ',
                                      style: TextStyle(
                                          fontFamily: 'BalsamiqSans_Regular',
                                          fontSize: 18,
                                          color: Colors.black),
                                    ),
                                    Icon(
                                      Icons.score,
                                      color: Colors.green,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 22),
                                child: Text(
                                  ' Date Posted :${dataList[index].detail}',
                                  style: TextStyle(
                                      fontFamily: 'BalsamiqSans_Regular',
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            '${dataList[index].image}',
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                        ),
                      ],
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
