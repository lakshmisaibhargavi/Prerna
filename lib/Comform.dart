import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_ip/get_ip.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prerna/home.dart';

class ComForm extends StatefulWidget {
  const ComForm({Key key}) : super(key: key);
  @override
  _ComFormState createState() => _ComFormState();
}

Color backgroundColor = Color.fromRGBO(130, 205, 113, 1);

class _ComFormState extends State<ComForm> {
  String ip;
  File _image;
  final picker = ImagePicker();
  Future<void> getip() async {
    ip = await GetIp.ipAddress;
    print("IP address");
    print(ip);
  }

  void initState() {
    super.initState();
    getip();
  }

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

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
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
                              MediaQuery.of(context).size.shortestSide > 400
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
                              MediaQuery.of(context).size.shortestSide > 400
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
                                    'Upload Logo',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ))
                                : Image.file(_image),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  width: 2,
                                  color: Colors.green,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
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
                            "* ENTER THE COMPANY NAME",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            child: TextField(
                              style: TextStyle(color: Colors.grey),
                              onChanged: (value) {},
                              cursorColor: Colors.blue,
                              decoration: InputDecoration(
                                hintText: " COMPANY NAME",
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
                      " * ENTER THE COMPANY INOGURATION DATE",
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
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                                  onChanged: (value) {},
                                  cursorColor: Colors.blue,
                                  decoration: InputDecoration(
                                    hintText: "NAME",
                                    border: InputBorder.none,
                                  ),
                                ),
                                margin: EdgeInsets.symmetric(vertical: 10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                width: width * 0.12,
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
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                                  onChanged: (value) {},
                                  cursorColor: Colors.blue,
                                  decoration: InputDecoration(
                                    hintText: "NAME",
                                    border: InputBorder.none,
                                  ),
                                ),
                                margin: EdgeInsets.symmetric(vertical: 10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                width: width * 0.12,
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
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                                  onChanged: (value) {},
                                  cursorColor: Colors.blue,
                                  decoration: InputDecoration(
                                    hintText: "NAME",
                                    border: InputBorder.none,
                                  ),
                                ),
                                margin: EdgeInsets.symmetric(vertical: 10),
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
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      "* ENTER THE COMPANY PHONE NUMBER",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Container(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        style: TextStyle(color: Colors.grey),
                        onChanged: (value) {},
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                          hintText: " PHONE NUMBER",
                          hintStyle:
                              TextStyle(color: Colors.green, fontSize: 10),
                          border: InputBorder.none,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: width * 0.5,
                      height: height * 0.06,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: Text(
                      " * ENTER THE COMPANY ADDRESS",
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
                            onChanged: (value) {},
                            cursorColor: Colors.blue,
                            decoration: InputDecoration(
                              hintText: "Lane",
                              hintStyle: TextStyle(color: Colors.green),
                              border: InputBorder.none,
                            ),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          width: width * 0.8,
                          height: height * 0.06,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 1.0),
                          child: Container(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.grey),
                              onChanged: (value) {},
                              cursorColor: Colors.blue,
                              decoration: InputDecoration(
                                hintText: "AREA",
                                hintStyle: TextStyle(color: Colors.green),
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
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(color: Colors.grey),
                                  onChanged: (value) {},
                                  cursorColor: Colors.blue,
                                  decoration: InputDecoration(
                                    hintText: "CITY/TOWN",
                                    hintStyle: TextStyle(color: Colors.green),
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
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Container(
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(color: Colors.grey),
                                    onChanged: (value) {},
                                    cursorColor: Colors.blue,
                                    decoration: InputDecoration(
                                      hintText: "PIN CODE",
                                      hintStyle: TextStyle(color: Colors.green),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  width: width * 0.23,
                                  height: height * 0.06,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
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
                        {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard(
                                        type: "c",
                                      )));
                        }
                      },
                      child: Container(
                        height: 50,
                        width: width * 0.5,
                        child: Center(
                            child: Text(
                          "SAVE",
                          style: TextStyle(color: Colors.black, fontSize: 20),
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
                'assets/company.png',
                height: height * 0.2,
              )),
        ],
      ),
    );
  }
}
