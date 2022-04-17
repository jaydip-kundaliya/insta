import 'package:flutter/material.dart';

import '../../controllers/feed_controller.dart';
import 'feed_post.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.separated(
          itemCount: FeedController.feedController.feedItems.length,
          itemBuilder: (BuildContext context, int index) {
            return const FeedPostView();
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 10);
          },
        ),
      ),
    );
  }
}
