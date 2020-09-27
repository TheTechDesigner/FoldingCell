import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell/widget.dart';
import 'package:folding_cell_example/images.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFC41A3B),
        primaryColorLight: Color(0xFFFBE0E6),
        accentColor: Color(0xFF1B1F32),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'Folding Cell';
  final _key = GlobalKey<SimpleFoldingCellState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Container(
        // color: Color(0xFFFBE0E6),
        alignment: Alignment.center,
        child: SimpleFoldingCell.create(
          key: _key,
          frontWidget: _frontWidget(),
          innerWidget: _innerWidget(),
          onOpen: () => print('Open'),
          onClose: () => print('Closed'),
          cellSize: Size(MediaQuery.of(context).size.width, 148.0),
          padding: EdgeInsets.all(16.0),
          animationDuration: Duration(milliseconds: 280),
          skipAnimation: false,
          borderRadius: 12.0,
        ),
      ),
    );
  }

  Widget _frontWidget() {
    return Container(
      color: Color(0xFFC41A3B),
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              'Youtube Channel',
              style: TextStyle(
                color: Color(0xFFFBE0E6),
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            right: 5,
            bottom: 0,
            child: FlatButton(
              onPressed: () => _key?.currentState?.toggleFold(),
              child: Text(
                'Open',
                style: TextStyle(color: Colors.black),
              ),
              color: Color(0xFFFBE0E6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _innerWidget() {
    return Container(
      color: Color(0xFFFBE0E6),
      // alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          //you can use text, image or any widget.
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'The Tech Designer',
                style: TextStyle(
                  color: Color(0xFFC41A3B),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Image(
              image: AssetImage(logo),
              height: 200.0,
            ),
          ),
          Positioned(
            right: 5,
            bottom: 0,
            child: FlatButton(
              onPressed: () => _key?.currentState?.toggleFold(),
              child: Text(
                'Close',
                style: TextStyle(color: Colors.white),
              ),
              color: Color(0xFFC41A3B),
            ),
          ),
        ],
      ),
    );
  }
}
