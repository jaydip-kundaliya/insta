import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/route_service.dart';
import '../../utils/app_text_style.dart';
import '../../utils/dummy_data.dart';
import '../shared/profile_avatar.dart';

/// Stories Holder
///
/// It is rounded profile circles which displayed
/// in feed screen
///
/// on tap of circle user can watch other user stories
class StoryHolderPage extends StatelessWidget {
  const StoryHolderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List<Widget>.generate(
          DummyRepo().users().length,
          (int index) => GestureDetector(
            onTap: () {
              Get.toNamed(Routes.storyPage);
            },
            child: SizedBox(
              width: 75,
              height: 80,
              child: Column(
                children: <Widget>[
                  ProfileAvatar(
                    radius: 30,
                    imageUrl: DummyRepo().users()[index].avatar!,
                    showBorders: true,
                  ),
                  Text(
                    DummyRepo().users()[index].username ?? '',
                    style: AppTextStyle.poppins(
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
