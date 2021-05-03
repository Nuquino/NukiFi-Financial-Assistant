import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

import 'HiveBoxes.dart';
import 'db/transactions.dart';

// ignore: camel_case_types
class AddNewTransactionPage extends StatefulWidget {
  AddNewTransactionPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _AddNewTransactionPageState createState() => _AddNewTransactionPageState();
}

class _AddNewTransactionPageState extends State<AddNewTransactionPage> {
  int currentIndex = 1;

  final _transactionFormKey = GlobalKey<FormState>();

  String merchantTitle;
  var transactionTotal;

  Box transactionBox;


  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width;

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Add a New Transaction'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text('Merchant Name'),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Form(key: _transactionFormKey,
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              child: Container(
                width: deviceWidth * .8,
                child: Column(

                    children: <Widget>[
                      // Add TextFormFields and ElevatedButton here

                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a name for the merchant';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter the name for your merchant',
                            hintText: 'Market Place'),
                        onChanged: (value) {
                          setState(() {
                            merchantTitle = value;
                          });
                        },
                      ),
                      Padding(padding: EdgeInsets.all(20)),
                      Text('Enter The Transaction Amount'),
                      Padding(padding: EdgeInsets.all(10)),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an amount for the transaction';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter the amount of the transaction',
                            hintText: '100.00'),
                        onChanged: (value) {
                          setState(() {
                            transactionTotal = int.parse(value);
                          });
                        },
                      ),

                      Padding(padding: EdgeInsets.all(15)),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0),),
                          primary: Colors.lightBlue,
                          onPrimary: Colors.lightBlueAccent,
                          elevation: 20,
                          minimumSize: Size(200,50),
                        ),
                        child: Text ('Continue', style: TextStyle(color: Colors.white, fontSize: 25)),
                        onPressed: _validateAndSave,
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),

    );
  }

  void _validateAndSave() {
    final form = _transactionFormKey.currentState;
    if (form.validate()) {
      _onFormSubmit();
    } else {
      print('Please fill out the category details');
    }
  }

  void _onFormSubmit() {
    transactionBox = Hive.box<transaction>(HiveBoxes.transactions);
    transactionBox.add(transaction(merchantName: merchantTitle, transactionAmount: transactionTotal, transactionTime: null, category: null, subcategory: null));
    Navigator.pushNamed(context, '/budgetPage');
    print("Add Transaction Form Submitted");
  }
}
