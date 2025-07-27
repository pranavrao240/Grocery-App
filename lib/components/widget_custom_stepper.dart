import 'package:flutter/material.dart';

class CustomStepper extends StatefulWidget {
  CustomStepper(
      {required this.lowerLimit,
      required this.upperLimit,
      required this.stepValue,
      required this.iconSize,
      required this.value,
      required this.onValueChange,
      super.key});
  final int lowerLimit;
  final int upperLimit;
  final int stepValue;
  final double iconSize;
  int value;
  final ValueChanged<dynamic> onValueChange;

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(right: 2),
              child: Icon(Icons.remove,
                  size: widget.iconSize, color: Colors.white),
            ),
            onTap: () {
              setState(() {
                widget.value = widget.value == widget.lowerLimit
                    ? widget.lowerLimit
                    : widget.value -= widget.stepValue;

                widget.onValueChange({"qty": widget.value, "type": "-"});
              });
            },
          ),
          SizedBox(
            width: widget.iconSize,
            child: Text(
              widget.value.toString(),
              style: TextStyle(
                fontSize: widget.iconSize * .7,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(right: 2),
              child: Icon(Icons.add, size: 20, color: Colors.black),
            ),
            onTap: () {
              setState(() {
                widget.value = widget.value == widget.upperLimit
                    ? widget.upperLimit
                    : widget.value += widget.stepValue;

                widget.onValueChange({"qty": widget.value, "type": "+"});
              });
            },
          ),
        ],
      ),
    );
  }
}
