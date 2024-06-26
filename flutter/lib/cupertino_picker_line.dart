import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

  Widget _buildInlineSelectionOverlay(BuildContext context) {
    if (selectionOverlayBuilder != null) {
      return selectionOverlayBuilder!(context, SelectionOverlayPosition.inline);
    }

    return CupertinoPickerSelectionOverlay();
  }

  Widget _buildLeftEdgeSelectionOverlay(BuildContext context) {
    if (selectionOverlayBuilder != null) {
      return selectionOverlayBuilder!(context, SelectionOverlayPosition.leftEdge);
    }

    return CupertinoPickerSelectionOverlay.roundedLeftSide();
  }
  
  Widget _buildRightEdgeSelectionOverlay(BuildContext context) {
    if (selectionOverlayBuilder != null) {
      return selectionOverlayBuilder!(context, SelectionOverlayPosition.rightEdge);
    }

    return CupertinoPickerSelectionOverlay.roundedRightSide();
  }

  Widget _buildItem(BuildContext context, String data) {
    if (itemBuilder != null) {
      return itemBuilder!(context, data);
    }

    return Center(
      child: Text(data),
    );
  }
}

class CupertinoPickerLineItemData {
  final double width;
  final String? Function(BuildContext, int) itemTextBuilder;

  const CupertinoPickerLineItemData({
    this.width = 80,
    required this.itemTextBuilder,
  });
}