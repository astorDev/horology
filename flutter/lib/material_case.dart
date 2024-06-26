import 'package:flutter/material.dart';
import 'package:horology/cupertino.dart';

class MaterialCase extends StatelessWidget {
  const MaterialCase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('😎'),
            const SizedBox(width: 20),
            Expanded(child: TextField(
              decoration: InputDecoration(
                isDense: true,
                labelText: 'Just a reference text field.',
              ),
            )),
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
                selectionOverlayBuilder: (context, position) => CupertinoPickerSelectionOverlay.underline(context: context),
                initialDateTime: DateTime.now().add(Duration(days: -1)),
                onSelectionChanged: (value) {
                  print(value);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
