import 'package:flutter/material.dart';
import 'assets/bottom_navy_bar.dart';

// ignore: camel_case_types
class BillCalendarPage extends StatefulWidget {
  BillCalendarPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyBudgetPageState createState() => _MyBudgetPageState();
}

class _MyBudgetPageState extends State<BillCalendarPage> {
  int _counter = 0;
  int currentIndex = 2;

  void _addNewBill() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
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
          title: Text('Bill Calendar'),
        ),
        drawer: new Drawer(
            child: ListView(
              children: <Widget> [
                new UserAccountsDrawerHeader(
                  accountName: new Text('Ben Reinhardt'),
                  accountEmail: new Text('benreinhardt@NukiFi.com'),
                  currentAccountPicture: new CircleAvatar(
                    backgroundImage: new NetworkImage('https://i.pravatar.cc/300'),
                  ),
                )
              ],
            )
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'This is the bill calendar page',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: _addNewBill,
          backgroundColor: Colors.green,
          tooltip: 'Add a New Category',
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.

        bottomNavigationBar: BottomNavyBar(
            backgroundColor: Colors.black26,
            selectedIndex: currentIndex,
            showElevation: true,
            itemCornerRadius: 8,
            onItemSelected: (index) => setState(() {
              currentIndex = index;

              if(currentIndex == 0) {
                Navigator.pushNamed(context, '/budgetPage');
              }

              if(currentIndex == 1) {
                Navigator.pushNamed(context, '/insightsPage');
              }

              if(currentIndex == 3) {
                Navigator.pushNamed(context, '/settings');
              }

            }),
            items: [
              BottomNavyBarItem(
                icon: Icon(Icons.monetization_on_outlined),
                title: Text('Budget'),
                activeColor: Colors.red,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.assessment_outlined),
                title: Text('Insights'),
                activeColor: Colors.purpleAccent,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.date_range),
                title: Text('Bills'),
                activeColor: Colors.green,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.settings_outlined),
                title: Text('Settings'),
                activeColor: Colors.blue,
              )
            ]));
  }
}