import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horology/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horology Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Horology'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('😎'),
                  const SizedBox(width: 20),
                  Expanded(child: CupertinoTextField()),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('🕒'),
                  const SizedBox(width: 20),
                  SizedBox(
                    height: 50,
                    child: CupertinoDateTimePicker(
                      initialDateTime: DateTime.now().add(Duration(days: -1)),
                      onSelectionChanged: (value) {
                        print(value);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimePickerOriginal extends StatelessWidget {
  const TimePickerOriginal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 50,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.dateAndTime,
        onDateTimeChanged: (value) {
          print(value);
        },
      ),
    );
  }
}