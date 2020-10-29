import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter devicePixelRatio test',
      home: MyHomePage(title: 'devicePixelRatio test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // based on: https://gist.github.com/bdiegel/81d0f4b7c13212048d4bcb15cb202de6
    // js version: https://gist.github.com/tkadlec/3118128
    MediaQueryData queryData =  MediaQuery.of(context);
    double devicePixelRatio = queryData.devicePixelRatio;
    double screenWidth = window.physicalSize.width;
    double screenHeight = window.physicalSize.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'devicePixelRatio: ${devicePixelRatio.toStringAsFixed(3)}',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'size (pixels): w=${(queryData.size.width * devicePixelRatio).toStringAsFixed(2)}, h=${(queryData.size.height * devicePixelRatio).toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headline6,
            ),
            // Text(
            //   'size (phisycal): w=${screenWidth.toStringAsFixed(2)}, h=${screenHeight.toStringAsFixed(2)}',
            //   style: Theme.of(context).textTheme.headline6,
            // ),
            Text(
              'size: w=${queryData.size.width.toStringAsFixed(2)}, h=${queryData.size.height.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'textScaleFactor: w=${queryData.textScaleFactor.toStringAsFixed(3)}',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
