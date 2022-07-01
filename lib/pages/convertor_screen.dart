//Convertor ScreenView
import 'package:flutter/material.dart';
import '../themes/themes.dart';
import './unit_convertor.dart';
import 'package:flutter/services.dart';

class ConvertorView extends StatefulWidget {
  const ConvertorView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ConvertorView> createState() => _ConvertorView();
}

class _ConvertorView extends State<ConvertorView> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      print("${_pxTopt(20)}pt");
    });
  }

  double _pxTopt(double px) {
    //double px;
    double pt = px * 0.75;
    return pt;
  }

  //final space = Spacer(2);

  Widget buildCalculator() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const UnitConvertorClass(),
                //const Spacer(flex: 1),
                const SizeBox(size: 20),
                const UnitConvertorClass(),
                const SizeBox(size: 20),
                //const UnitConvertorClass(),
                //const Spacer(flex: 1),
                buildConvertor(),
                const SizeBox(size: 20),

                //const Spacer(flex: 1),
              ]),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> get dropdownUnits {
    List<DropdownMenuItem<String>> unitsList = [
      const DropdownMenuItem(child: Text("px"), value: "px"),
      const DropdownMenuItem(child: Text("pt"), value: "pt"),
      const DropdownMenuItem(child: Text("em"), value: "em"),
      const DropdownMenuItem(child: Text("sp"), value: "sp"),
    ];
    return unitsList;
  }

  ///Method to do the converting
  void _convert(double val, String current, String to) {
    ///converted is the value of the converted input
    ///current is the value of the currently selected unit measure
    ///to is the value of the unit to be converted to
    double converted;
    switch (current) {
      case "px":
        {
          if (to == "em") {
            converted = val * 0.0625;
            print("$converted is em");
          } else if (to == "pt") {
            converted = val * 0.75;
            print("$val is pt");
          } else if (to == "px") {
            converted = val;
            print("$converted is px");
          }
        }
        break;
      case "pt":
        {
          if (to == "em") {
            converted = val * 0.083645834169792;
            print("$converted is em");
          } else if (to == "pt") {
            converted = val;
            print("$val is pt");
          } else if (to == "px") {
            converted = val / 0.75;
            print("$converted is px");
          }
        }
        break;
      case "em":
        {
          if (to == "em") {
            converted = val;
            print("$converted is em");
          } else if (to == "pt") {
            converted = val / 0.083645834169792;
            print("$val is pt");
          } else if (to == "px") {
            converted = val / 0.0625;
            print("$converted is px");
          }
        }
        break;
      default:
        {
          converted = 0;
          print("def");
        }
        break;
    }
  }

  String selectedUnit = "pt";

  Widget buildConvertor() {
    return Row(
      children: [
        DropdownButton(
          style: Theme.of(context).textTheme.headline4,
          items: dropdownUnits,
          value: selectedUnit,
          onChanged: (String? newValue) {
            setState(() {
              selectedUnit = newValue!;
            });
          },
        ),
        const Spacer(
          flex: 1,
        ),
        Column(
          children: <Widget>[
            Text(
              "21",
              style: Theme.of(context).textTheme.headline4,
            ),
            Text("words"),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizeBox(size: 20),
          buildCalculator(),
          const Text(
            'You have pushed this buttons this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SizeBox extends StatelessWidget {
  const SizeBox({Key? key, required this.size}) : super(key: key);

  final double? size;
  //SizeBox({this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
    );
  }
}
