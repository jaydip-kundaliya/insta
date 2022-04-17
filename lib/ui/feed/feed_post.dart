import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../models/feed_item.dart';
import '../../models/user.dart';
import '../../utils/dummy_data.dart';
import '../../utils/extensions.dart';
import '../shared/profile_avatar.dart';

/// Single Feed post view
///
/// UserInfo | Image | Menu | Actions | Comments
class FeedPostView extends StatelessWidget {
  const FeedPostView({
    Key? key,
    required this.feedItem,
  }) : super(key: key);

  final FeedItem feedItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child: _UserPlat(user: feedItem.owner!),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          child: ExtendedImage.network(
            feedItem.postImage!,
            width: double.infinity,
            height: 300,
            fit: BoxFit.contain,
            enableMemoryCache: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child: _FeedPostBottom(
            feedItem: feedItem,
          ),
        )
      ],
    );
  }
}

/// Widget for display the user information
/// about the post
class _UserPlat extends StatelessWidget {
  const _UserPlat({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            right: 8.0,
          ),
          child: ProfileAvatar(
            imageUrl: user.avatar!,
            radius: 15,
          ),
        ),
        Expanded(
          child: Text(
            user.username ?? '',
          ),
        ),
        const Icon(
          Icons.more_vert_outlined,
        )
      ],
    );
  }
}

/// Feed post bottom actions with comment
/// and view counts
class _FeedPostBottom extends StatelessWidget {
  const _FeedPostBottom({Key? key, required this.feedItem}) : super(key: key);
  final FeedItem feedItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                right: 12.0,
              ),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.favorite_border_outlined,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 12.0,
              ),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.chat_bubble_outline_outlined,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 12.0,
              ),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.send_outlined,
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.bookmark_border_outlined,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text('${feedItem.totalViews} views'),
        Text('${feedItem.postDescription}'),
        const SizedBox(height: 8),
        const _EasyCommentView(),
        Text(
          feedItem.postDateTime!.toBasicString(),
        )
      ],
    );
  }
}

class _EasyCommentView extends StatelessWidget {
  const _EasyCommentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            right: 8.0,
          ),
          child: ProfileAvatar(
            imageUrl: DummyRepo().profileAvatars[0],
            radius: 15,
          ),
        ),
        const Expanded(
          child: Text('Add a comment...'),
        ),
      ],
    );
  }
}
