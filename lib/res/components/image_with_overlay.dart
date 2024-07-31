import 'package:flutter/material.dart';

class ImageWithOverlayText extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;
  final double imageHeight;
  final double containerWidth;
  final double borderRadius;
  final Color overlayColor;
  final TextStyle titleStyle;
  final TextStyle dateStyle;

  const ImageWithOverlayText({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.date,
    this.imageHeight = 200.0,
    this.containerWidth = 300.0,
    this.borderRadius = 30.0,
    this.overlayColor = Colors.white,
    this.titleStyle = const TextStyle(
      fontSize: 20,
      fontFamily: 'Arial',
      fontWeight: FontWeight.w400,
    ),
    this.dateStyle = const TextStyle(
      fontSize: 16,
      fontFamily: 'Arial',
      fontWeight: FontWeight.w400,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: imageHeight,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            width: containerWidth,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: overlayColor.withOpacity(0.9),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(borderRadius),
                bottomRight: Radius.circular(borderRadius),
              ),
              border: Border.all(
                color: Colors.grey.shade200,
                width: 2.0,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '  $title',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: titleStyle,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '   $date',
                    style: dateStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
