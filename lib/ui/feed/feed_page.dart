import 'package:flutter/material.dart';

import '../../controllers/feed_controller.dart';
import '../shared/app_bar.dart';
import '../story/story_holders.dart';
import 'feed_post.dart';

/// Main Home Instagram Feed page
///
/// Stories | Posts
class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppbar(
        title: 'Instagram clone',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const StoryHolderPage(),
            const SizedBox(height: 10),
            Column(
              children: List<Widget>.generate(
                FeedController.feedController.feedItems.length,
                (int index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: FeedPostView(
                    feedItem: FeedController.feedController.feedItems[index],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
