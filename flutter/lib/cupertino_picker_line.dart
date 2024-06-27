import 'package:flutter/cupertino.dart';
import 'package:horology/cupertino_picker_selection_overlay.dart';

enum SelectionOverlayPosition {
  inline,
  leftEdge,
  rightEdge,
}

class CupertinoPickerLine extends StatelessWidget {
  final double height;
  final double itemExtent;
  final List<CupertinoPickerLineItemData> itemsData;
  final Widget Function(BuildContext, String)? itemBuilder;
  final Function(List<int>)? onSelectionChanged;
  final Widget Function(BuildContext, SelectionOverlayPosition)? selectionOverlayBuilder;
  
  const CupertinoPickerLine({
    super.key,
    required this.itemsData,
    this.itemBuilder,
    this.height = 50,
    this.itemExtent = 30,
    this.onSelectionChanged,
    this.selectionOverlayBuilder,
  });
  
  @override
  Widget build(BuildContext context) {
    var selectedIndexes = List.generate(itemsData.length, (index) => 0);

    List<Widget> children = [];

    for (int i = 0; i < itemsData.length; i++) {
      CupertinoPickerLineItemData item = itemsData[i];

      Widget selectionOverlay = _buildInlineSelectionOverlay(context);
      if (i == 0) selectionOverlay = _buildLeftEdgeSelectionOverlay(context);
      if (i == itemsData.length - 1) selectionOverlay = _buildRightEdgeSelectionOverlay(context);

      children.add(
        SizedBox(
          width: item.width,
          height: height,
          child: CupertinoPicker.builder(
            itemExtent: itemExtent,
            onSelectedItemChanged: (index) {
              selectedIndexes[i] = index;
              onSelectionChanged?.call(selectedIndexes);
            },
            scrollController: FixedExtentScrollController(initialItem: 0),
            selectionOverlay: selectionOverlay,
            itemBuilder: (context, index) {
              var text = item.itemTextBuilder(context, index);
              return text == null ? null : _buildItem(context, text);
            }
          ),
        ),
      );
    }

    return Row(
      children: children,
    );
  }

  Widget _buildInlineSelectionOverlay(BuildContext context) =>
      selectionOverlayBuilder?.call(context, SelectionOverlayPosition.inline) ??
      CupertinoPickerSelectionOverlay();

  Widget _buildLeftEdgeSelectionOverlay(BuildContext context) =>
      selectionOverlayBuilder?.call(context, SelectionOverlayPosition.leftEdge) ??
      CupertinoPickerSelectionOverlay.roundedLeftSide();
  
  Widget _buildRightEdgeSelectionOverlay(BuildContext context) =>
      selectionOverlayBuilder?.call(context, SelectionOverlayPosition.rightEdge) ??
      CupertinoPickerSelectionOverlay.roundedRightSide();

  Widget _buildItem(BuildContext context, String data) =>
      itemBuilder?.call(context, data) ??
      Center(
        child: Text(data),
      );
}

class CupertinoPickerLineItemData {
  final double width;
  final String? Function(BuildContext, int) itemTextBuilder;

  const CupertinoPickerLineItemData({
    this.width = 80,
    required this.itemTextBuilder,
  });
}