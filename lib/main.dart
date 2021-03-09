import 'package:flutter/material.dart';
import 'package:nukifi_financial_assistant/budgetPage.dart';
import 'package:nukifi_financial_assistant/insightsPage.dart';
import 'package:nukifi_financial_assistant/billCalendarPage.dart';
import 'package:nukifi_financial_assistant/settings.dart';
import 'package:nukifi_financial_assistant/login.dart';
import 'package:nukifi_financial_assistant/AddNewCategoryPage.dart';

import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NukiFi Financial Assistant',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        fontFamily: 'Roboto',
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
      ),
      home: LoginPage(),
      routes: <String, WidgetBuilder> {
        '/budgetPage': (context) => BudgetPage(),
        '/insightsPage': (context) => InsightsPage(),
        '/billCalendarPage': (context) => BillCalendarPage(),
        '/settings': (context) => SettingsPage(),
        '/addNewCategoryPage': (context)  =>  AddNewCategoryPage(),
      },
    );
  }
}




