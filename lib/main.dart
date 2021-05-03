import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nukifi_financial_assistant/HiveBoxes.dart';
import 'package:nukifi_financial_assistant/budgetPage.dart';
import 'package:nukifi_financial_assistant/insightsPage.dart';
import 'package:nukifi_financial_assistant/billCalendarPage.dart';
import 'package:nukifi_financial_assistant/settings.dart';
import 'package:nukifi_financial_assistant/AddNewCategoryPage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'AddNewTransactionPage.dart';
import 'db/budget.dart';
import 'db/accountInfo.dart';
import 'db/subcategories.dart';
import 'db/transactions.dart';

import 'AddNewSubcategoryPage.dart';
import 'onStartup.dart';
import 'overview.dart';

void main() async {
  print("Boxes attempting to be opened");
  //initializing hive and the hive boxes/adapters
  await Hive.initFlutter();

  Hive.registerAdapter(AccountInfoAdapter());
  await Hive.openBox<AccountInfo>(HiveBoxes.accountInfo);

  Hive.registerAdapter(BudgetCategoryAdapter());
  await Hive.openBox<BudgetCategory>(HiveBoxes.categories);

  Hive.registerAdapter(BudgetSubcategoryAdapter());
  await Hive.openBox<BudgetSubcategory>(HiveBoxes.subcategories);

  Hive.registerAdapter(transactionAdapter());
  await Hive.openBox<transaction>(HiveBoxes.transactions);

  print('Boxes Opened');

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() async {
    Hive.close();
    super.dispose();
  }

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
      home: StartupPage(),
      routes: <String, WidgetBuilder> {
        '/budgetPage': (context) => BudgetPage(),
        '/insightsPage': (context) => InsightsPage(),
        '/billCalendarPage': (context) => BillCalendarPage(),
        '/settings': (context) => SettingsPage(),
        '/addNewCategoryPage': (context)  =>  AddNewCategoryPage(),
        '/overview': (context)  =>  OverviewPage(),
        '/startupPage': (context)  =>  StartupPage(),
        '/addNewSubcategoryPage': (context)  =>  AddNewSubcategoryPage(),
        '/addNewTransactionPage': (context)  =>  AddNewTransactionPage(),
      },
    );
  }
}




