import 'package:flutter/cupertino.dart';

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