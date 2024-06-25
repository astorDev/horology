import 'package:flutter/cupertino.dart';
import 'package:horology/cupertino_picker_line.dart';

class CupertinoDateTimePicker extends StatelessWidget {
  final Function(DateTime)? onSelectionChanged;
  final DateTime? initialDateTime;

  const CupertinoDateTimePicker({
    super.key,
    this.onSelectionChanged,
    this.initialDateTime
  });
  
  @override
  Widget build(BuildContext context) {
    var zeroDateTime = initialDateTime ?? DateTime.now();
    var zeroIsToday = initialDateTime == null;

    int hourFromIndex(int index) => (zeroDateTime.hour + index) % 24;
    int minuteFromIndex(int index) => (zeroDateTime.minute + index) % 60;

    return CupertinoPickerLine(
      onSelectionChanged: (indexes) {
        var selectedDateOnly = zeroDateTime.add(Duration(days: indexes[0]));
        var selectedHour = hourFromIndex(indexes[1]);
        var selectedMinute = minuteFromIndex(indexes[2]);
        var selected = DateTime(
          selectedDateOnly.year, 
          selectedDateOnly.month, 
          selectedDateOnly.day, 
          selectedHour, 
          selectedMinute
        );
    
        onSelectionChanged?.call(selected);
      },
      itemsData: [
        CupertinoPickerLineItemData(
          width: 130, 
          itemTextBuilder: (context, index) {
            var localization = CupertinoLocalizations.of(context);
      
            if (zeroIsToday && index == 0) return localization.todayLabel;
            
            var selectedDate = zeroDateTime.add(Duration(days: index));
            return localization.datePickerMediumDate(selectedDate);
          },
        ),
        CupertinoPickerLineItemData(
          width: 80, 
          itemTextBuilder: (context, index) {
            var hours = (zeroDateTime.hour + index) % 24;
            return hours.toString().padLeft(2, '0');
          },
        ),
        CupertinoPickerLineItemData(
          width: 40, 
          itemTextBuilder: (context, index) {
            var minutes = (zeroDateTime.minute + index) % 60;
            return minutes.toString().padLeft(2, '0');
          },
        ),
      ],
    );
  }
}
