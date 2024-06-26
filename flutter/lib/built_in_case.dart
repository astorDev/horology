import 'package:flutter/cupertino.dart';

class BuiltInCase extends StatelessWidget {
  const BuiltInCase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
          children: [
            const Text('🕒'),
            const SizedBox(width: 20),
            SizedBox(
              width: 290,
              height: 50,
              child: CupertinoDatePicker(
                initialDateTime: DateTime.now().add(Duration(days: -1)),
                onDateTimeChanged: (value) {
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