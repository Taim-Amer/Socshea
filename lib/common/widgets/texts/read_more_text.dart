import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class TReadMoreText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color? moreLessColor;
  final int trimLines;

  const TReadMoreText({
    super.key,
    required this.text,
    this.textStyle,
    this.moreLessColor,
    this.trimLines = 5,
  });

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLines: trimLines,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'more',
      trimExpandedText: 'less',
      style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
      colorClickableText: moreLessColor ?? Theme.of(context).primaryColor,
      moreStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: moreLessColor ?? Theme.of(context).primaryColor,
      ),
      lessStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: moreLessColor ?? Theme.of(context).primaryColor,
      ),
    );
  }
}
