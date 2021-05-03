import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:nukifi_financial_assistant/db/budget.dart';

import 'HiveBoxes.dart';

// ignore: camel_case_types
class AddNewCategoryPage extends StatefulWidget {


  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  _AddNewCategoryPageState createState() {
    return _AddNewCategoryPageState();
  }
}

class _AddNewCategoryPageState extends State<AddNewCategoryPage> {
  int currentIndex = 1;
  final _categoryFormKey = GlobalKey<FormState>();

  String categoryTitle;
  var categoryTotal;

  Box categoryBox;

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
          title: Text('Add a New Category'),
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
                child: Text('Category Name'),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Form(key: _categoryFormKey,
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                child: Container(
                  width: deviceWidth * .8,
                  child: Column(

                      children: <Widget>[
                        // Add TextFormFields and ElevatedButton here

                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a name for the category';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter the name for your category',
                              hintText: 'Number 1 category'),
                          onChanged: (value) {
                            setState(() {
                              categoryTitle = value;
                            });
                          },
                        ),
                        Padding(padding: EdgeInsets.all(20)),
                        Text('Enter The Category Budget'),
                        Padding(padding: EdgeInsets.all(10)),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an amount';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter the budget for the category',
                              hintText: '100'),
                          onChanged: (value) {
                            setState(() {
                              categoryTotal = int.parse(value);
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
    final form = _categoryFormKey.currentState;
    if (form.validate()) {
      _onFormSubmit();
    } else {
      print('Please fill out the category details');
    }
  }

  void _onFormSubmit() {
    categoryBox = Hive.box<BudgetCategory>(HiveBoxes.categories);
    categoryBox.add(BudgetCategory(categoryName: categoryTitle, totalCategoryBudget: categoryTotal, currentSpent: 0));
    Navigator.pushNamed(context, '/budgetPage');
    print("Add Category Form Submitted");
  }
}