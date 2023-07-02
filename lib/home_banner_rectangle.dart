import 'package:flutter/material.dart';

class HomeBannerRectangle extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final String subtitle;
  final String badgeText;

  const HomeBannerRectangle(
      {super.key,
      required this.backgroundColor,
      required this.title,
      required this.subtitle,
      required this.badgeText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w700)),
              Text(subtitle,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500))
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Text(
              badgeText,
              style: TextStyle(
                  color: HSLColor.fromColor(backgroundColor)
                      .withLightness(0.50)
                      .toColor(),
                  fontSize: 10),
            ),
          )
        ],
      ),
    );
  }
}
