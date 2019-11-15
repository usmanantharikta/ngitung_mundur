import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('My Page!')),
      drawer: AppDrawer()
    );
  }
}

 class AppDrawer extends StatelessWidget {
   @override
   Widget build(BuildContext context){
     return Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            // DrawerHeader(
            //   child: Text('Drawer Header'),
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //   ),
            // ),
            _createHeader(),
            _createItemDrawer(icon: Icons.event, text:  'Wedding'),
            _createItemDrawer(icon: Icons.cake, text:  'BirthDay'),
            // ListTile(
            //   title: Text('Item 1'),
            //   onTap: () {
            //     // Update the state of the app
            //     // ...
            //     // Then close the drawer
            //     Navigator.pop(context);
            //   },
            // ),
            // Divider(),
            // ListTile(
            //   title: Text('Item 2'),
            //   onTap: () {
            //     // Update the state of the app
            //     // ...
            //     // Then close the drawer
            //     Navigator.pop(context);
            //   },
            // ),
          ],
        ),
      );
   }

   Widget _createItemDrawer({IconData icon, String text, GestureTapCallback onTap}){
     return ListTile (
       title: Row (children: <Widget>[
         Icon(icon),
         Padding(
           padding: EdgeInsets.only(left: 8.0),
           child: Text(
             text,
             style: TextStyle(fontSize: 12.0),
           )
         )
       ],),
       onTap: onTap,
     );
   }

   Widget _createHeader() {
    return DrawerHeader(
        // child: Text('Ngitung Mundur'),
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.green,
          image: DecorationImage(
              fit: BoxFit.fill,
              image:  AssetImage('assets/meong.jpeg'))
        ),
        child: Stack(children: <Widget>[
        Positioned(
            bottom: 12.0,
            left: 24.0,
            child: Text("Ngitung Mundur",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500))),
      ])
      );
  }
 }