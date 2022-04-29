import 'package:flutter/foundation.dart';

import 'user.dart';

@immutable
class Reel {
  const Reel({
    this.id,
    this.reelPost,
    this.user,
    this.description,
    this.totalLikes,
    this.totalComments,
  });

  /// unique reel-id
  final String? id;

  /// real content it self
  final String? reelPost;

  /// reel's owner user
  final User? user;

  /// user profile picture
  final String? description;

  /// total number of likes on feed post [int]
  final int? totalLikes;

  /// total number of comments on feed post [int]
  final int? totalComments;
}
