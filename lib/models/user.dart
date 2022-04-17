import 'package:flutter/foundation.dart';

@immutable
class User {
  const User({
    this.id,
    this.name,
    this.avatar,
    this.username,
  });

  /// unique user-id
  final String? id;

  /// particular single user full name
  final String? name;

  /// user profile picture
  final String? avatar;

  /// single username or nickname on server
  final String? username;
}
