import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:prerna/home.dart';
import 'package:web3dart/web3dart.dart';

class Ib extends StatefulWidget {
  final name;
  final imei;
  final lane;
  final city;
  final state;
  final pincode;
  final date;
  final month;
  final year;

  final plantdate = 000000;

  const Ib({
    Key key,
    this.name,
    this.imei,
    this.lane,
    this.city,
    this.state,
    this.pincode,
    this.date,
    this.month,
    this.year,
  }) : super(key: key);
  @override
  _IbState createState() => _IbState(pincode);
}

class _IbState extends State<Ib> {
  final pincode;
  Client httpClint;

  Web3Client ethclint;
  var mydata;
  DateTime now;
  bool busy = true;

  final myaddress = "0x52c8777570f8532A4482922DAAdb0B27e759ef02";
  String contractadd = "0xC7496DC168D2549C7b31f08AF99cBE4eE5402115";

  _IbState(this.pincode);
  @override
  void initState() {
    super.initState();
    print(widget.name);
    print(widget.imei);
    print(pincode);
    now = DateTime.now();
    httpClint = Client();
    ethclint = Web3Client(
        "https://rinkeby.infura.io/v3/161e6d1ab0d042eb94444abfba339391",
        httpClint);
    gethi(contractadd);
  }

  Future<DeployedContract> loadcontract() async {
    String abi = await rootBundle.loadString("assets/abi.json");

    final contract = DeployedContract(ContractAbi.fromJson(abi, "reva"),
        EthereumAddress.fromHex(contractadd));
    return contract;
  }

  Future<List<dynamic>> query(String fname, List<dynamic> args) async {
    final contract = await loadcontract();
    final ethfunction = contract.function(fname);
    final result = await ethclint.call(
        contract: contract, function: ethfunction, params: args);
    return result;
  }

  Future<void> gethi(String address) async {
    //EthereumAddress aa = EthereumAddress.fromHex(address);
    List<dynamic> result = await query("individual", [
      widget.name, //name
      BigInt.from(100), //age
      widget.lane, //lane
      widget.city, //city
      widget.state, //state
      BigInt.from(00000), //pincode
      BigInt.from(10), //date
      BigInt.from(10), //month
      BigInt.from(2020), //year

      BigInt.from(123), //imei
    ]);

    print(mydata);
    setState(() {
      busy = false;
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return !busy
        ? Dashboard(
            type: "u",
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
