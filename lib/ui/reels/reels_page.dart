import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/reel_controller.dart';
import '../../utils/app_text_style.dart';
import 'single_reel_view.dart';

class ReelsPage extends StatelessWidget {
  const ReelsPage({Key? key}) : super(key: key);

  static final ReelController _reelController = ReelController.reelController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Stack(
            children: <Widget>[
              PageView.builder(
                itemCount: _reelController.reels.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) => ReelView(
                  reel: _reelController.reels[index],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: kToolbarHeight,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Reels',
                          style: AppTextStyle.poppins(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        const Icon(
                          Icons.local_see_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
