import 'package:flutter/cupertino.dart';

class BuiltInCase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoReferenceTextFieldRow(),
        const SizedBox(height: 20),
        DatePickerRow(),
        //PickerDefault()
        //PickerDecap()
      ],
    );
  }
}

class CupertinoReferenceTextFieldRow extends StatelessWidget {
  const CupertinoReferenceTextFieldRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('😎'),
        const SizedBox(width: 20),
        Expanded(child: CupertinoTextField(
          placeholder: 'Just a reference text field',
        )),
      ],
    );
  }
}

class DatePickerRow extends StatelessWidget {
  const DatePickerRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('🕒'),
        const SizedBox(width: 20),
        Expanded(
          child: SizedBox(
            height: 80,
            child: CupertinoDatePicker(
              onDateTimeChanged: (value) {},
            ),
          ),
        ),
      ],
    );
  }
}

class PickerDefault extends StatelessWidget {
  const PickerDefault({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('🟡'),
        const SizedBox(width: 20),
        Expanded(
          child: SizedBox(
            height: 80,
            child: CupertinoPicker.builder(
              itemExtent: 30, 
              onSelectedItemChanged: (_) {}, 
              itemBuilder: (context, index) => Text('Item $index')
            )
          ),
        ),
      ],
    );
  }
}

class PickerDecap extends StatelessWidget {
  const PickerDecap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('🟨'),
        const SizedBox(width: 20),
        Expanded(
          child: SizedBox(
            height: 80,
            child: CupertinoPicker.builder(
              itemExtent: 30, 
              selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
                capStartEdge: false,
                capEndEdge: false,
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

class BuiltInCase2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('😎'),
        const SizedBox(width: 20),
        Expanded(
          child: CupertinoDatePicker(
            initialDateTime: DateTime.now(),
            onDateTimeChanged: (value) {
              print(value);
            },
          ),
        ),
      ],
    );
  }

}