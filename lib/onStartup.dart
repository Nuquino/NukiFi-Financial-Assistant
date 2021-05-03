import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nukifi_financial_assistant/budgetPage.dart';
import 'package:nukifi_financial_assistant/db/accountInfo.dart';

import 'HiveBoxes.dart';

class StartupPage extends StatefulWidget {
  @override
  _StartupPageState createState() {
      return _StartupPageState();
  }
}

class _StartupPageState extends State<StartupPage> {
  final _nameFormKey = GlobalKey<FormState>();

  String name;

  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('NukiFi Financial Assistant'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 250,
                    height: 250,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('NukiFiLogo.png')),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Text('What would you like to be called?', style: TextStyle(fontSize: 25)),
            ),

            Form(key: _nameFormKey,
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              child: Container(
                width: deviceWidth * .8,
                child: Column(

                  children: <Widget>[
                  // Add TextFormFields and ElevatedButton here

                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your name',
                      hintText: 'Billy Bob Joe'),
                    onChanged: (value) {
                      setState(() {
                        name = value;
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
    final form = _nameFormKey.currentState;
    if (form.validate()) {
      _onFormSubmit();
    } else {
      print('Please fill out a name');
    }
  }

  void _onFormSubmit() {
    Box<AccountInfo> accountBox = Hive.box<AccountInfo>(HiveBoxes.accountInfo);
    accountBox.add(AccountInfo(nickname: name, budgetTimeFrame: 0));
    Navigator.push(context, MaterialPageRoute(builder: (_) => BudgetPage( title: 'NukiFi Financial Assistant')));
    print("Name Form Submitted");
  }
}