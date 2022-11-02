import 'package:calculator/provider/calculator_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

const buttonsBackgroundColor = Colors.white;
const backgroundColor = Colors.white;
const contrastColor = Color(0xFF2EA69C);
const numbersColor = Color(0xFF969696);

AppBar appbar(
  BuildContext context,
  String title,
) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
    ),
  );
}

class CalculatorButton extends StatelessWidget {
  final String label;
  final bool isColored, isEqualSign, canBeFirst, isClear;
  const CalculatorButton(
    this.label, {
    this.isColored = false,
    this.isEqualSign = false,
    this.canBeFirst = true,
    this.isClear = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calculatorProvider =
    Provider.of<CalculatorProvider>(context, listen: false);
    final TextStyle? textStyle = Theme.of(context).textTheme.headline6;
    final mediaQuery = MediaQuery.of(context).size;
    return Material(
      color: buttonsBackgroundColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: () {
          calculatorProvider.addToEquation(
            label,
            canBeFirst,
            context,
          );
        },
        child: Center(
          child: isEqualSign
              ? Container(
            height: mediaQuery.width * 0.1,
            width: mediaQuery.width * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: contrastColor,
            ),
            child: Center(
              child: Text(
                label,
                style: textStyle?.copyWith(color: backgroundColor),
              ),
            ),
          )
              : isClear
                  ? Container(
            child: Center(
              child: Text(
                  label,
                  style: textStyle?.copyWith(
                      fontSize: 30,
                      color: Colors.orange,
                      fontWeight: FontWeight.normal
                  ),
                  )
                )
              )
              : Text(
            label,
            style: textStyle?.copyWith(
                color: isColored ? contrastColor : numbersColor,
                fontWeight: isColored? FontWeight.w300 : FontWeight.normal,
                fontSize: 30),
          ),
        ),
      ),
    );
  }
}

void showToast(BuildContext context, String message) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 400),
    ),
  );
}

List<CalculatorButton> buttons = <CalculatorButton>[
  CalculatorButton('C',isClear: true, canBeFirst: false),
  CalculatorButton(' ', canBeFirst: false),
  CalculatorButton('⌫', isColored: true, canBeFirst: false),
  CalculatorButton(' ÷ ', isColored: true, canBeFirst: false),
  CalculatorButton('7'),
  CalculatorButton('8'),
  CalculatorButton('9'),
  CalculatorButton(' × ', isColored: true, canBeFirst: false),
  CalculatorButton('4'),
  CalculatorButton('5'),
  CalculatorButton('6'),
  CalculatorButton(' - ', isColored: true, canBeFirst: false),
  CalculatorButton('1'),
  CalculatorButton('2'),
  CalculatorButton('3'),
  CalculatorButton(' + ', isColored: true, canBeFirst: false),
  CalculatorButton(' '),
  CalculatorButton('0'),
  CalculatorButton('.'),
  CalculatorButton('=', isEqualSign: true, canBeFirst: false),
];
