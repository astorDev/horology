import 'package:flutter/cupertino.dart';
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
    );
  }
}
