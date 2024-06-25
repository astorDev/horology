import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  CupertinoDateTimePicker(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CupertinoDateTimePicker extends StatelessWidget {
  const CupertinoDateTimePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: CupertinoPickerLine(
        items: [
          CupertinoPickerLineItem(width: 100, itemTextBuilder: (context, index) => 'A$index'),
          CupertinoPickerLineItem(width: 80, itemTextBuilder: (context, index) => 'B$index'),
          CupertinoPickerLineItem(width: 40, itemTextBuilder: (context, index) => 'C$index'),
        ],
      ),
    );
  }
}

class CupertinoPickerLineItem {
  final double width;
  final int initialItem;
  final String? Function(BuildContext, int) itemTextBuilder;

  const CupertinoPickerLineItem({
    this.width = 80,
    this.initialItem = 0,
    required this.itemTextBuilder,
  });
}

class CupertinoPickerLine extends StatelessWidget {
  final double height;
  final double itemExtent;
  final List<CupertinoPickerLineItem> items;
  
  const CupertinoPickerLine({
    super.key,
    required this.items,
    this.height = 50,
    this.itemExtent = 30,
  });

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];

    for (int i = 0; i < items.length; i++) {
      CupertinoPickerLineItem item = items[i];

      Widget selectionOverlay = CupertinoPickerSelectionOverlay.inline();
      if (i == 0) selectionOverlay = CupertinoPickerSelectionOverlay.inlineLeftSide();
      if (i == items.length - 1) selectionOverlay = CupertinoPickerSelectionOverlay.inlineRightSide();

      children.add(
        SizedBox(
          width: item.width,
          child: CupertinoPicker.builder(
            itemExtent: itemExtent,
            onSelectedItemChanged: (value) {
              print(value);
            },
            scrollController: FixedExtentScrollController(initialItem: 2),
            selectionOverlay: selectionOverlay,
            itemBuilder: (context, index) {
              var text = item.itemTextBuilder(context, index);

              return text == null ? null : Center(
                child: Text(
                    text,
                    style: const TextStyle(fontSize: 20),
                  ),
              );
            }
          ),
        ),
      );
    }

    return Row(
      children: children,
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

class CupertinoPickerSelectionOverlay extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final BorderRadiusGeometry borderRadius;
  final Color background;
  static const double _defaultSelectionOverlayHorizontalMargin = 9;
  static const double _defaultSelectionOverlayRadius = 8;
  
  const CupertinoPickerSelectionOverlay({
    super.key,
    this.background = CupertinoColors.tertiarySystemFill,
    this.margin = const EdgeInsets.symmetric(horizontal: _defaultSelectionOverlayHorizontalMargin),
    this.borderRadius = const BorderRadiusDirectional.horizontal(
      start: Radius.circular(_defaultSelectionOverlayRadius),
      end: Radius.circular(_defaultSelectionOverlayRadius),
    ),
  });  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: CupertinoDynamicColor.resolve(background, context),
      ),
    );
  }

  factory CupertinoPickerSelectionOverlay.inline() {
    return const CupertinoPickerSelectionOverlay(
      margin: EdgeInsets.zero,
      borderRadius: BorderRadius.zero,
    );
  }

  factory CupertinoPickerSelectionOverlay.inlineLeftSide() {
    return const CupertinoPickerSelectionOverlay(
      margin: EdgeInsets.zero,
      borderRadius: BorderRadiusDirectional.horizontal(
        start: Radius.circular(_defaultSelectionOverlayRadius),
      ),
    );
  }

  factory CupertinoPickerSelectionOverlay.inlineRightSide() {
    return const CupertinoPickerSelectionOverlay(
      margin: EdgeInsets.zero,
      borderRadius: BorderRadiusDirectional.horizontal(
        end: Radius.circular(_defaultSelectionOverlayRadius),
      ),
    );
  }

}