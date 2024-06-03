import 'package:flutter/material.dart';

void main() {
  runApp(Demo());
}

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive GridView Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive GridView Example'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            // For tablets and larger screens
            return GridView.count(
              crossAxisCount: 4,
              children: List.generate(
                20,
                    (index) => Container(
                  color: Colors.blueAccent,
                  margin: EdgeInsets.all(5.0),
                  child: Center(
                    child: Text(
                      'Item $index',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            );
          } else {
            // For mobile phones
            return GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                20,
                    (index) => Container(
                  color: Colors.blueAccent,
                  margin: EdgeInsets.all(5.0),
                  child: Center(
                    child: Text(
                      'Item $index',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}