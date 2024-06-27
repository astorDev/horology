import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horology/built_in_case.dart';
import 'package:horology/cupertino.dart';

class MainCase extends StatelessWidget {
  const MainCase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CupertinoReferenceTextFieldRow(),
        const SizedBox(height: 20),
        MainDateTimePickerRow(),
        //PickerUnmargined()
        //PickerLineRaw()
      ],
    );
  }
}

class MainDateTimePickerRow extends StatelessWidget {
  const MainDateTimePickerRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('🕒'),
        const SizedBox(width: 20),
        CupertinoDateTimePicker(
          height: 80,
          initialDateTime: DateTime.now(),
          onSelectionChanged: (value) {
            print(value);
          },
        ),
      ],
    );
  }
}

class PickerUnmargined extends StatelessWidget {
  const PickerUnmargined({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('🟢'),
        const SizedBox(width: 20),
        Expanded(
          child: SizedBox(
            height: 80,
            child: CupertinoPicker.builder(
              itemExtent: 30, 
              selectionOverlay: CupertinoPickerSelectionOverlay(
                borderRadius: BorderRadius.circular(8),
              ),
              onSelectedItemChanged: (_) {}, 
              itemBuilder: (context, index) => Text('Item $index')
            )
          ),
        ),
      ],
    );
  }
}

class PickerLineRaw extends StatelessWidget {
  const PickerLineRaw({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('🏭'),
        const SizedBox(width: 20),
        CupertinoPickerLine(
          height: 80,
          itemsData: [
            CupertinoPickerLineItemData(
              width: 80,
              itemTextBuilder: (context, index) => 'A $index',
            ),
            CupertinoPickerLineItemData(
              width: 80,
              itemTextBuilder: (context, index) => 'B $index',
            ),
            CupertinoPickerLineItemData(
              width: 80,
              itemTextBuilder: (context, index) => 'C $index',
            ),
          ]
        )
      ],
    );
  }
}