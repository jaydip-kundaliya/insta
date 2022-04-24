import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';

import '../../controllers/stories_controller.dart';

/// Story viewer for watch the stories for users
///
/// After click on any user story holder in feed user
/// will navigate to this page and can watch the stories
///
/// After all stories been watched then
/// user will navigate back to feed
class StoryViewerPage extends StatelessWidget {
  const StoryViewerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryView(
        storyItems: StoriesController.storiesController.storyItems,
        controller: StoriesController.storiesController.storyController,
        onComplete: () {
          Get.back();
        },
      ),
    );
  }
}
