import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../models/comment.dart';
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
        Text(
          '${feedItem.totalLikes} likes',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 2),
        Row(
          children: [
            Text(
              '${feedItem.owner?.username}',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 2),
            Text('${feedItem.postDescription}'),
          ],
        ),
        _CommentSection(comments: feedItem.comments ?? <Comment>[]),
        const _EasyCommentView(),
        const SizedBox(height: 2),
        Text(
          feedItem.postDateTime!.toTimeAgo(),
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.grey[600],
          ),
        )
      ],
    );
  }
}

class _CommentSection extends StatelessWidget {
  const _CommentSection({
    Key? key,
    this.comments = const <Comment>[],
  }) : super(key: key);

  final List<Comment> comments;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        comments.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                ),
                child: Text(
                  'View all ${comments.length} comments',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                ),
              )
            : const SizedBox(),
        comments.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${comments[0].user?.username}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text('${comments[0].commentText}'),
                  ],
                ),
              )
            : const SizedBox(),
        comments.length > 1
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${comments[1].user?.username}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text('${comments[1].commentText}'),
                  ],
                ),
              )
            : const SizedBox(),
        const SizedBox(height: 3),
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
            radius: 12,
          ),
        ),
        Expanded(
          child: Text(
            'Add a comment...',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.grey[600],
            ),
          ),
        ),
      ],
    );
  }
}
