import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPickerSelectionOverlay extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final BorderRadiusGeometry borderRadius;
  final Color background;
  final BoxBorder? border;
  static const double _defaultSelectionOverlayRadius = 8;
  
  const CupertinoPickerSelectionOverlay({
    super.key,
    this.background = CupertinoColors.tertiarySystemFill,
    this.margin = const EdgeInsets.all(0),
    this.borderRadius = const BorderRadius.all(Radius.zero),
    this.border
  });  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: border,
        color: CupertinoDynamicColor.resolve(background, context),
      ),
    );
  }

  factory CupertinoPickerSelectionOverlay.roundedLeftSide() {
    return const CupertinoPickerSelectionOverlay(
      borderRadius: BorderRadiusDirectional.horizontal(
        start: Radius.circular(_defaultSelectionOverlayRadius),
      ),
    );
  }

  factory CupertinoPickerSelectionOverlay.roundedRightSide() {
    return const CupertinoPickerSelectionOverlay(
      borderRadius: BorderRadiusDirectional.horizontal(
        end: Radius.circular(_defaultSelectionOverlayRadius),
      ),
    );
  }

  factory CupertinoPickerSelectionOverlay.underline({ double width = 0.5 }) {
    return CupertinoPickerSelectionOverlay(
      background: Colors.transparent,
      border: Border(
        bottom: BorderSide(
          width: width,
        ),
      ),
      borderRadius: BorderRadius.zero
    );
  }
}