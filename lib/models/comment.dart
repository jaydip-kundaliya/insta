import 'package:flutter/foundation.dart';

import 'user.dart';

@immutable
class Comment {
  const Comment({
    this.user,
    this.commentText,
    this.totalLikes,
    this.commentTime,
    this.replies,
  });

  /// comment owner/user info
  final User? user;

  /// comment string on feed post
  final String? commentText;

  /// feed single comment total likes [int]
  final int? totalLikes;

  /// comment registered date + time
  final DateTime? commentTime;

  /// total list of comment replied on single selected comment
  final List<Comment>? replies;
}
