import 'dart:ui';

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
  DateTime? _dateTime;
  TimeOfDay? _timeOfDay;

  getDate() async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day),
        firstDate: DateTime(DateTime.now().year - 20),
        lastDate: DateTime(DateTime.now().year + 2));

    setState(() {
      _dateTime = date!;
      print(_dateTime);
    });
  }

  getTime() async {
    TimeOfDay? day =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    setState(() {
      _timeOfDay = day!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Flutter Widget"), backgroundColor: Colors.black12),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: _switchChecked ? Colors.blueGrey : Colors.cyan,
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
              },
            ),
          ),
          ExpansionTile(
            title: Text("One"),
            subtitle: Text("This is one"),
            trailing: Icon(Icons.arrow_downward),
            children: [
              Container(
                height: 100,
                color: Colors.cyan,
              )
            ],
          ),
          Tooltip(
            message: "Container",
            child: Container(
              height: 100,
              color: Colors.blueGrey,
            ),
          ),
          Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(),
              height: 100,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(color: Colors.blue.withOpacity(0.3)),
              )),
          SizedBox(height: 20),
          Center(
            child: Container(
              height: 100,
              width: 100,
              transform: Matrix4.rotationZ(-30),
              color: Colors.pink,
            ),
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.topLeft,
            height: 100,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  color: Colors.pink,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            getDate();
                          },
                          child: Text("DatePicker")),
                      ElevatedButton(
                          onPressed: () {
                            getTime();
                          }, child: Text("TimePicker")),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  color: Colors.blue,
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        _dateTime == null
                            ? Text("Choose Date")
                            : Text(
                                "Date: ${_dateTime?.day}-${_dateTime?.month}-${_dateTime?.year}",
                                style: TextStyle(color: Colors.white)),
                        _timeOfDay == null
                            ? Text("Choose Time")
                            : Text(
                                "Time: ${_timeOfDay?.hour}:${_timeOfDay?.minute}",
                                style: TextStyle(color: Colors.white),
                              )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
