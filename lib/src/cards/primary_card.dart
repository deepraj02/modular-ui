import 'package:flutter/material.dart';
import 'package:modular_ui/src/buttons/primary_button.dart';
import 'package:modular_ui/src/utils/dimensions.dart';

class MUIPrimaryCard extends StatefulWidget {
  /// The title of the card
  final String title;

  /// Text style of the title
  final TextStyle titleStyle;

  /// The description of the card
  final String description;

  /// Text style of the description
  final TextStyle descriptionStyle;

  /// Image widget to display in the card
  final Widget image;

  /// The background color of the card
  final Color bgColor;

  /// The border radius of the card
  final double borderRadius;

  /// Border Radius of the image
  final double imageRadius;

  /// Text of the button
  final String buttonText;

  /// Outer Horizontal Margin for card
  final double horizontalMargin;

  /// Outer Vertical Margin for card
  final double verticalMargin;

  /// On Tap Function
  final VoidCallback onButtonTap;

  /// max width of the card, width of the card can not exceed this value
  /// If the screen width is less than this value then the widget will be responsive to the screen size
  /// Else if screen width is greater than this maxWidth then the widget width will be equal to maxWidth
  final double maxWidth;

  /// Overall height of this widget, It has a fixed value by default
  /// You can provide a dynamic height to this widget or leave it as it is.
  final double widgetHeight;

  const MUIPrimaryCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.onButtonTap,
    required this.buttonText,
    this.descriptionStyle = const TextStyle(
      fontSize: 16,
      color: Colors.grey,
    ),
    this.titleStyle = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    this.bgColor = Colors.white,
    this.borderRadius = 8,
    this.imageRadius = 8,
    this.horizontalMargin = 0,
    this.verticalMargin = 0,
    this.maxWidth = 430,
    this.widgetHeight = 550,
  });

  @override
  State<MUIPrimaryCard> createState() => _MUIPrimaryCardState();
}

class _MUIPrimaryCardState extends State<MUIPrimaryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(context) <= widget.maxWidth
          ? getScreenWidth(context) * 0.88
          : widget.maxWidth,
      height: widget.widgetHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        color: widget.bgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(
        vertical: widget.verticalMargin,
        horizontal: widget.horizontalMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DecoratedBox(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 12,
                  offset: const Offset(2, 4),
                ),
              ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(widget.imageRadius),
                child: widget.image,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: widget.titleStyle),
                const SizedBox(height: 8),
                Text(
                  widget.description,
                  style: widget.descriptionStyle,
                ),
                const SizedBox(height: 8),
                MUIPrimaryButton(
                  text: widget.buttonText,
                  onTap: widget.onButtonTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
