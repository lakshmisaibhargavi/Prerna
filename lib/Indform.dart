import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import 'home.dart';
import 'ib.dart';

class Indform extends StatefulWidget {
  const Indform({Key key}) : super(key: key);
  @override
  _IndformState createState() => _IndformState();
}

Color backgroundColor = Colors.blue.shade200;
String city;
int pincode;
String lane;
String name;
String state;
int date;
int month;
int year;

class _IndformState extends State<Indform> {
  File _image;
  final picker = ImagePicker();
  List _outputs;

  bool _loading = false;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
      numThreads: 1,
    );
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.2,
        asynch: true);
    setState(() {
      _loading = false;
      print(output[0].label);
    });
  }

  void dispose() {
    super.dispose();
    Tflite.close();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return !_loading
        ? Scaffold(
            backgroundColor: backgroundColor,
            body: Stack(
              children: [
                Container(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.06),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text(
                              '<- Back',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.shortestSide >
                                            400
                                        ? 18
                                        : 14,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.08),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text(
                              'PROFILE',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.shortestSide >
                                            400
                                        ? 25
                                        : 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 30),
                              child: GestureDetector(
                                onTap: () {
                                  getImage();
                                  setState(() {});
                                },
                                child: Container(
                                  child: _image == null
                                      ? Center(
                                          child: Text(
                                          'Upload Photo',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14),
                                        ))
                                      : Image.file(
                                          _image,
                                          fit: BoxFit.cover,
                                          height: height * 0.08,
                                          width: width * 0.20,
                                        ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.green,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  height: height * 0.12,
                                  width: width * 0.25,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "* ENTER THE PLANET RANGER NAME",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  child: TextField(
                                    style: TextStyle(color: Colors.grey),
                                    onChanged: (value) {
                                      setState(() {
                                        name = value;
                                      });
                                    },
                                    cursorColor: Colors.blue,
                                    decoration: InputDecoration(
                                      hintText: "NAME",
                                      hintStyle: TextStyle(
                                          color: Colors.green, fontSize: 10),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  width: width * 0.5,
                                  height: height * 0.06,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10),
                          child: Text(
                            " * ENTER THE PLANET RANGER DATE OF BIRTH",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      child: Text(
                                        "DATE",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      child: TextField(
                                        keyboardType: TextInputType.phone,
                                        style: TextStyle(color: Colors.grey),
                                        onChanged: (value) {
                                          setState(() {
                                            date = (value) as int;
                                          });
                                        },
                                        cursorColor: Colors.blue,
                                        decoration: InputDecoration(
                                          hintText: "DD",
                                          hintStyle: TextStyle(
                                              color: Colors.green,
                                              fontSize: 10),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      width: width * 0.15,
                                      height: height * 0.06,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      child: Text(
                                        "MONTH",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      child: TextField(
                                        keyboardType: TextInputType.phone,
                                        style: TextStyle(color: Colors.grey),
                                        onChanged: (value) {
                                          setState(() {
                                            month = (value) as int;
                                          });
                                        },
                                        cursorColor: Colors.blue,
                                        decoration: InputDecoration(
                                          hintText: "MM",
                                          hintStyle: TextStyle(
                                              color: Colors.green,
                                              fontSize: 10),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      width: width * 0.15,
                                      height: height * 0.06,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      child: Text(
                                        "YEAR",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      child: TextField(
                                        keyboardType: TextInputType.phone,
                                        style: TextStyle(color: Colors.grey),
                                        onChanged: (value) {
                                          setState(() {
                                            year = (value) as int;
                                          });
                                        },
                                        cursorColor: Colors.blue,
                                        decoration: InputDecoration(
                                          hintText: "YYYY",
                                          hintStyle: TextStyle(
                                              color: Colors.green,
                                              fontSize: 10),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      width: width * 0.17,
                                      height: height * 0.06,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10),
                          child: Text(
                            " * ENTER THE RANGER ADDRESS",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            children: [
                              Container(
                                child: TextField(
                                  style: TextStyle(color: Colors.grey),
                                  onChanged: (value) {
                                    setState(() {
                                      lane = value;
                                    });
                                  },
                                  cursorColor: Colors.blue,
                                  decoration: InputDecoration(
                                    hintText: "Lane",
                                    hintStyle: TextStyle(
                                        color: Colors.green, fontSize: 10),
                                    border: InputBorder.none,
                                  ),
                                ),
                                margin: EdgeInsets.symmetric(vertical: 10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                width: width * 0.8,
                                height: height * 0.06,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 1.0),
                                child: Container(
                                  child: TextField(
                                    style: TextStyle(color: Colors.grey),
                                    onChanged: (value) {
                                      setState(() {
                                        city = value;
                                      });
                                    },
                                    cursorColor: Colors.blue,
                                    decoration: InputDecoration(
                                      hintText: "CITY",
                                      hintStyle: TextStyle(
                                          color: Colors.green, fontSize: 10),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  width: width * 0.8,
                                  height: height * 0.06,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3.0, horizontal: 28),
                                child: Row(
                                  children: [
                                    Container(
                                      child: TextField(
                                        style: TextStyle(color: Colors.grey),
                                        onChanged: (value) {
                                          setState(() {
                                            state = value;
                                          });
                                        },
                                        cursorColor: Colors.blue,
                                        decoration: InputDecoration(
                                          hintText: "STATE",
                                          hintStyle: TextStyle(
                                              color: Colors.green,
                                              fontSize: 10),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      width: width * 0.5,
                                      height: height * 0.06,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Container(
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(color: Colors.grey),
                                          onChanged: (value) {
                                            setState(() {
                                              pincode = (value) as int;
                                            });
                                          },
                                          cursorColor: Colors.blue,
                                          decoration: InputDecoration(
                                            hintText: "PIN CODE",
                                            hintStyle:
                                                TextStyle(color: Colors.green),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                        margin:
                                            EdgeInsets.symmetric(vertical: 10),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        width: width * 0.23,
                                        height: height * 0.06,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 30),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard(
                                            type: "I",
                                          )));

                              /*
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Ib(
                                            imei: widget.imei,
                                            city: city,
                                            lane: lane,
                                            name: name,
                                            pincode: pincode,
                                            state: state,
                                            date: date,
                                            month: month,
                                            year: year,
                                          )));*/
                            },
                            child: Container(
                              height: 50,
                              width: width * 0.5,
                              child: Center(
                                  child: Text(
                                "RUSH",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              )),
                              decoration: BoxDecoration(
                                  color: Colors.brown[300],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: height * 0.02,
                    right: 0,
                    child: Image.asset(
                      'assets/business-man.png',
                      height: height * 0.2,
                    )),
              ],
            ),
          )
        : Center(child: CircularProgressIndicator());
  }
}
