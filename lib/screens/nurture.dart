import 'package:flutter/material.dart';

class Nurture extends StatefulWidget {
  final data;
  final imei;

  const Nurture({Key key, this.data, this.imei}) : super(key: key);
  @override
  _NurtureState createState() => _NurtureState();
}

Color backgroundColor = Colors.black;

class _NurtureState extends State<Nurture> {
  List<Data> dataList = [];
  @override
  void initState() {
    super.initState();
    dataList.add(
        Data('assets/plants1.png', 'assets/ab1.png', 'Rahul', '2-10-10', 2));
    dataList.add(
        Data('assets/plants2.png', 'assets/ab2.jpg', 'Akhil', '21-10-10', 3));
    dataList
        .add(Data('assets/plants3.png', 'assets/ab3.jpg', 'ME', '29-9-10', 5));
    dataList.add(
        Data('assets/plants4.png', 'assets/ab4.png', 'AAAAA', '9-10-10', 2));
    dataList.add(
        Data('assets/plants5.png', 'assets/ab5.jpg', 'Hardly', '10-10-10', 1));
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
                maxHeight: 600,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1),
                  child: GestureDetector(
                      onTap: () {
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Testcase(
                                    imei: widget.imei,
                                    no: widget.data.length,
                                  )),
                        );*/
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.65,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    child: Center(
                                        child: Image.asset(
                                            '${dataList[index].image}')),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.red[500],
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      '${dataList[index].name}',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 200),
                                    child: Icon(Icons.more_vert),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                decoration: new BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            '${dataList[index].nimage}')),
                                    color: Colors.white,
                                    borderRadius: new BorderRadius.all(
                                      const Radius.circular(10.0),
                                    )),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Icon(Icons.favorite_border_outlined),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Icon(Icons.chat_bubble_outline),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Icon(Icons.share_sharp),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: Card(
                                      elevation: 10,
                                      child: Container(
                                        height: 30,
                                        width: 80,
                                        color: Colors.green,
                                        child: Center(
                                          child: Text(
                                            'Purchace',
                                            style: TextStyle(fontSize: 13),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 1.0,
                                  horizontal: 20,
                                ),
                                child: Text(
                                  '${dataList[index].detail}',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 33.6),
                              child: Container(
                                color: Colors.white,
                                height: 0.2,
                              ),
                            )
                          ],
                        ),
                      )),
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
