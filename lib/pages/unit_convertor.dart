//Unit convertor class

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UnitConvertorClass extends StatefulWidget {
  const UnitConvertorClass({Key? key}) : super(key: key);

  @override
  State<UnitConvertorClass> createState() => _UnitConvertorClassState();
}

class _UnitConvertorClassState extends State<UnitConvertorClass> {
  /// dropdownUnits - dropdown of units
  List<DropdownMenuItem<String>> get dropdownUnits {
    List<DropdownMenuItem<String>> unitsList = [
      const DropdownMenuItem(child: Text("px"), value: "px"),
      const DropdownMenuItem(child: Text("pt"), value: "pt"),
      const DropdownMenuItem(child: Text("em"), value: "em"),
      const DropdownMenuItem(child: Text("sp"), value: "sp"),
    ];
    return unitsList;
  }

  ///selectedUnit is the selected state of the drop down list item
  String selectedUnit = "px";
  String to = "px";
  double value = 0;

  TextEditingController inputController = TextEditingController();

  ///_isTouched confirms if a row is being selected
  final _isTouched = false;

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
  } //End of method

  //double get _values => meas;
  String numberValidator(String value) {
    if (value == null) {
      return "";
    }
    final n = num.tryParse(value);
    if (n == null) {
      return '"$value" is not a valid number';
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    final String measureAlias;
    final double measureValue;
    final bool isFocused;
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
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                width: 250,
                height: 40,
                child: TextFormField(
                  controller: inputController,
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.right,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(6),
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                  ],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                  onChanged: (val) {
                    _convert(double.parse(val), selectedUnit, "px");
                  },
                  //validator: numberValidator,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text(
                  selectedUnit,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
