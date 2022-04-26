import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

import '../models/comment.dart';
import '../models/feed_item.dart';
import '../models/user.dart';

/// This application is just for demo purpose
///
/// This repository include local dummy data
/// for application contents
class DummyRepo {
  // List of all available dummy profile picture
  final List<String> profileAvatars = <String>[
    'https://cdn.psychologytoday.com/sites/default/files/styles/article-inline-half-caption/public/field_blog_entry_images/2018-09/shutterstock_648907024.jpg',
    'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80',
    'https://st.depositphotos.com/1269204/1219/i/600/depositphotos_12196477-stock-photo-smiling-men-isolated-on-the.jpg',
    'data:image/jpeg;base64,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',
    'https://www.diethelmtravel.com/wp-content/uploads/2016/04/bill-gates-wealthiest-person.jpg',
    'https://timelinecovers.pro/facebook-cover/download/life-cycle-facebook-cover.jpg'
  ];

  // List of all available dummy post picture
  final List<String> posts = <String>[
    'https://cdn.psychologytoday.com/sites/default/files/styles/article-inline-half-caption/public/field_blog_entry_images/2018-09/shutterstock_648907024.jpg',
    'https://st.depositphotos.com/1269204/1219/i/600/depositphotos_12196477-stock-photo-smiling-men-isolated-on-the.jpg',
    'https://timelinecovers.pro/facebook-cover/download/life-cycle-facebook-cover.jpg'
  ];

  // list of all dummy data-time
  final List<DateTime> dateTimeDataList = <DateTime>[
    DateTime.now().subtract(const Duration(days: 54)),
    DateTime.now().subtract(const Duration(days: 15)),
    DateTime.now().subtract(const Duration(days: 12)),
    DateTime.now().subtract(const Duration(days: 86)),
    DateTime.now().subtract(const Duration(days: 75)),
    DateTime.now().subtract(const Duration(days: 87)),
    DateTime.now().subtract(const Duration(days: 02)),
    DateTime.now().subtract(const Duration(days: 35)),
    DateTime.now().subtract(const Duration(days: 74)),
    DateTime.now().subtract(const Duration(days: 01)),
  ];

  // list of all available dummy users
  List<User> users() => <User>[
        User(
          id: '01',
          name: 'Test User 1',
          username: 'user_01',
          avatar: profileAvatars[0],
        ),
        User(
          id: '02',
          name: 'Test User 2',
          username: 'user_02',
          avatar: profileAvatars[1],
        ),
        User(
          id: '03',
          name: 'Test User 3',
          username: 'user_03',
          avatar: profileAvatars[2],
        ),
        User(
          id: '04',
          name: 'Test User 4',
          username: 'user_04',
          avatar: profileAvatars[3],
        ),
        User(
          id: '05',
          name: 'Test User 5',
          username: 'user_05',
          avatar: profileAvatars[4],
        ),
      ];

  // list of all available dummy comments
  //
  // including sub-comments as well at some
  List<Comment> comments() => <Comment>[
        Comment(
          id: '01',
          commentText: 'This is comment 01',
          user: users()[0],
          totalLikes: 40,
          commentTime: dateTimeDataList[0],
        ),
        Comment(
          id: '02',
          commentText: 'This is comment 02',
          user: users()[1],
          totalLikes: 45,
          commentTime: dateTimeDataList[1],
          replies: <Comment>[
            Comment(
              id: '09',
              commentText: 'This is comment 09',
              user: users()[2],
              totalLikes: 05,
              commentTime: dateTimeDataList[3],
            ),
            Comment(
              id: '10',
              commentText: 'This is comment 10',
              user: users()[4],
              totalLikes: 0,
              commentTime: dateTimeDataList[4],
            ),
          ],
        ),
        Comment(
          id: '03',
          commentText: 'This is comment 03',
          user: users()[2],
          totalLikes: 36,
          commentTime: dateTimeDataList[2],
        ),
        Comment(
          id: '04',
          commentText: 'This is comment 04',
          user: users()[3],
          totalLikes: 15,
          commentTime: dateTimeDataList[3],
        ),
        Comment(
          id: '05',
          commentText: 'This is comment 05',
          user: users()[4],
          totalLikes: 4,
          commentTime: dateTimeDataList[4],
          replies: <Comment>[
            Comment(
              id: '11',
              commentText: 'This is comment 11',
              user: users()[1],
              totalLikes: 02,
              commentTime: dateTimeDataList[7],
            ),
          ],
        ),
        Comment(
          id: '06',
          commentText: 'This is comment 06',
          user: users()[4],
          totalLikes: 120,
          commentTime: dateTimeDataList[5],
        ),
        Comment(
          id: '07',
          commentText: 'This is comment 07',
          user: users()[1],
          totalLikes: 59,
          commentTime: dateTimeDataList[6],
        ),
        Comment(
          id: '08',
          commentText: 'This is comment 08',
          user: users()[2],
          totalLikes: 150,
          commentTime: dateTimeDataList[7],
          replies: <Comment>[
            Comment(
              id: '12',
              commentText: 'This is comment 12',
              user: users()[0],
              totalLikes: 04,
              commentTime: dateTimeDataList[3],
            ),
            Comment(
              id: '13',
              commentText: 'This is comment 13',
              user: users()[1],
              totalLikes: 0,
              commentTime: dateTimeDataList[7],
            ),
            Comment(
              id: '14',
              commentText: 'This is comment 14',
              user: users()[2],
              totalLikes: 10,
              commentTime: dateTimeDataList[0],
            ),
          ],
        ),
      ];

  // list of all available feed post
  List<FeedItem> feedItems() => <FeedItem>[
        FeedItem(
          id: '01',
          owner: users()[0],
          postImage: posts[0],
          postDescription: 'This is Insta-clone feed post item 01',
          postDateTime: dateTimeDataList[0],
          totalLikes: 450,
          totalViews: 10024,
          totalComments: 54,
          comments: comments(),
          // to remove owner from the user list
          relatedUsers:
              users().where((User item) => item.id != users()[0].id).toList(),
        ),
        FeedItem(
          id: '02',
          owner: users()[1],
          postImage: posts[1],
          postDescription: 'This is Insta-clone feed post item 02',
          postDateTime: dateTimeDataList[4],
          totalLikes: 500,
          totalViews: 680,
          totalComments: 10,
          comments: comments(),
          // to remove owner from the user list
          relatedUsers:
              users().where((User item) => item.id != users()[1].id).toList(),
        ),
        FeedItem(
          id: '03',
          owner: users()[2],
          postImage: posts[2],
          postDescription: 'This is Insta-clone feed post item 03',
          postDateTime: dateTimeDataList[1],
          totalLikes: 20,
          totalViews: 510,
          totalComments: 8,
          comments: comments(),
          // to remove owner from the user list
          relatedUsers:
              users().where((User item) => item.id != users()[2].id).toList(),
        ),
      ];

  // list of all available dummy stories
  List<StoryItem> storyItems() => <StoryItem>[
        StoryItem.text(
          title: 'This is story text 01',
          backgroundColor: Colors.black,
        ),
        StoryItem.pageProviderImage(
          NetworkImage(
            profileAvatars[0],
          ),
        ),
        StoryItem.pageProviderImage(
          NetworkImage(
            profileAvatars[2],
          ),
        ),
        StoryItem.text(
          title: 'This is story text 02',
          backgroundColor: Colors.pink,
        ),
      ];
}
