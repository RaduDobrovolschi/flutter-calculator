import 'package:calculator/provider/calculator_provider.dart';
import 'package:calculator/screens/calculator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:calculator/imports.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalculatorProvider>(
      create: (_) => CalculatorProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          appBarTheme: AppBarTheme(
            color: backgroundColor,
            elevation: 0.0,
          ),
          textTheme: TextTheme(
            caption: TextStyle(
              color: numbersColor,
              fontSize: 45.0,
            ),
          ),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: contrastColor),
        ),
        routes: {
          '/': (context) => Calculator(),
        },
      ),
    );
  }
}
