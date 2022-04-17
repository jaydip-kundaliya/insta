import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    Key? key,
    required this.imageUrl,
    this.radius,
  }) : super(key: key);

  final String imageUrl;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? 20,
      backgroundImage: NetworkImage(imageUrl),
    );
  }
}
