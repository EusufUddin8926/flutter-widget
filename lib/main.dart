import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _switchChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Widget"), backgroundColor: Colors.black12),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: _switchChecked?Colors.blueGrey: Colors.cyan,
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Switch(
              activeTrackColor: Colors.blue,
              value: _switchChecked,
              activeColor: Colors.red,
              onChanged: (value) {
              setState(() {
                _switchChecked = value;
              });
            },),
          )
        ],
      ),
    );
  }
}


