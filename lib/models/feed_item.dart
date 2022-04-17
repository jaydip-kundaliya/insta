import 'package:flutter/foundation.dart';

import 'comment.dart';
import 'user.dart';

@immutable
class FeedItem {
  const FeedItem({
    this.owner,
    this.postImage,
    this.postDescription,
    this.totalLikes,
    this.totalComments,
    this.totalViews,
    this.postDateTime,
    this.relatedUsers,
    this.comments,
  });

  /// owner user of single feed post
  final User? owner;

  /// feed post image content
  final String? postImage;

  /// single feed post description/subtitle
  final String? postDescription;

  /// total number of likes on feed post [int]
  final int? totalLikes;

  /// total number of comments on feed post [int]
  final int? totalComments;

  /// total number of views on feed post [int]
  final int? totalViews;

  /// date time of feed post registration
  final DateTime? postDateTime;

  /// all feed post related users include
  /// in comment and likes
  final List<User>? relatedUsers;

  /// all feed post comments
  final List<Comment>? comments;
}
