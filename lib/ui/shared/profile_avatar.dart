import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    Key? key,
    required this.imageUrl,
    this.radius,
    this.showBorders = false,
  }) : super(key: key);

  final String imageUrl;
  final double? radius;
  final bool showBorders;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: showBorders ? const EdgeInsets.all(2) : null,
      decoration: showBorders
          ? BoxDecoration(
              gradient: const LinearGradient(
                colors: <Color>[
                  Color(0xFFF52323),
                  Color(0xFFF80AF4),
                  Color(0xFFE57C37),
                  Color(0xFFF8A807),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.circular(100),
            )
          : null,
      child: CircleAvatar(
        radius: radius ?? 20,
        backgroundImage: NetworkImage(imageUrl),
      ),
    );
  }
}
