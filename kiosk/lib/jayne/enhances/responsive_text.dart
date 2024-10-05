import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kiosk/jayne/enhances/condition.dart';
import 'package:kiosk/jayne/enhances/responsive_element_functions.dart';

class ResponsiveText extends StatelessWidget {
  final TextStyle textStyle;
  final String content;
  final TextAlign? textAlign;
  final bool? softWrap;
  final String? tag;
  final int? maxLines;
  final TextOverflow? textOverFlow;
  final bool autoSize;
  final bool overFlowEllipsis;
  final double minFontSize;

  const ResponsiveText({
    super.key,
    required this.content,
    required this.textStyle,
    this.textAlign,
    this.softWrap,
    this.tag,
    this.maxLines,
    this.textOverFlow,
    this.autoSize = false,
    this.overFlowEllipsis = false,
    this.minFontSize = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double _fontSize = getResponsiveFontSize(screenWidth, textStyle.fontSize!);
    final String _content = overFlowEllipsis
        ? //
        content.characters.replaceAll(Characters(''), Characters('\u{200B}')).toString()
        : content;
    return Condition(
      condition: autoSize && content.isNotEmpty,
      builder: (_) => AutoSizeText(
        overFlowEllipsis ? _content : content,
        key: tag != null ? Key(tag!) : null,
        style: textStyle.copyWith(fontSize: _fontSize),
        maxLines: maxLines,
        textAlign: textAlign,
        minFontSize: minFontSize,
        maxFontSize: _fontSize <= minFontSize ? minFontSize : _fontSize,
        softWrap: softWrap,
        overflow: overFlowEllipsis ? TextOverflow.ellipsis : textOverFlow,
      ),
      fallback: (_) => Text(
        overFlowEllipsis ? _content : content,
        key: tag != null ? Key(tag!) : null,
        style: calculateFontSize(screenWidth, textStyle),
        textAlign: textAlign,
        softWrap: softWrap,
        maxLines: maxLines,
        overflow: overFlowEllipsis ? TextOverflow.ellipsis : textOverFlow,
      ),
    );
  }
}
