import 'package:flutter/material.dart';

import '../../models/reel.dart';
import '../../utils/app_text_style.dart';

class ReelView extends StatelessWidget {
  const ReelView({Key? key, this.reel}) : super(key: key);
  final Reel? reel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Text(
          reel?.user?.username ?? '',
          style: AppTextStyle.poppins(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
