//Convertor ScreenView
import 'package:flutter/material.dart';
import './unit_convertor.dart';

class ConvertorView extends StatefulWidget {
  const ConvertorView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ConvertorView> createState() => _ConvertorView();
}

class _ConvertorView extends State<ConvertorView> {
  Widget buildCalculator() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                UnitConvertorClass(),
                SizeBox(size: 20),
                UnitConvertorClass(),
                SizeBox(size: 20),
                UnitConvertorClass(),
                SizeBox(size: 20),

                //const Spacer(flex: 1),
              ]),
        ),
      ),
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
        ],
      ),
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
