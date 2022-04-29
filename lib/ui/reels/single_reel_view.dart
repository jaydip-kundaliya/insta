import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../models/reel.dart';
import '../../utils/app_text_style.dart';
import '../../utils/extensions.dart';
import '../shared/profile_avatar.dart';

class ReelView extends StatelessWidget {
  const ReelView({Key? key, this.reel}) : super(key: key);
  final Reel? reel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          Center(
            child: ExtendedImage.network(
              reel!.reelPost!,
              width: double.infinity,
              fit: BoxFit.contain,
              enableMemoryCache: true,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _ReelActions(reel: reel!),
          ),
        ],
      ),
    );
  }
}

class _ReelActions extends StatelessWidget {
  const _ReelActions({
    Key? key,
    required this.reel,
  }) : super(key: key);

  final Reel reel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Align(
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.favorite_border_outlined,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  reel.totalLikes!.toReadable(),
                  style: AppTextStyle.poppins(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.chat_bubble_outline_outlined,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  reel.totalComments.toString(),
                  style: AppTextStyle.poppins(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.send_outlined,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: _ReelInfo(
              reel: reel,
            ),
          ),
        ],
      ),
    );
  }
}

class _ReelInfo extends StatelessWidget {
  const _ReelInfo({
    Key? key,
    required this.reel,
  }) : super(key: key);

  final Reel reel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            ProfileAvatar(
              imageUrl: reel.user!.avatar!,
              radius: 15,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                reel.user!.username.toString(),
                style: AppTextStyle.poppins(
                  color: Colors.white,
                ),
              ),
            ),
            const Icon(
              Icons.more_vert_outlined,
              color: Colors.white,
            )
          ],
        ),
        const SizedBox(height: 10),
        Text(
          reel.description.toString(),
          style: AppTextStyle.poppins(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Text(
              'Audio',
              style: AppTextStyle.poppins(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: CircleAvatar(
                radius: 1.5,
                backgroundColor: Colors.white,
              ),
            ),
            Text(
              'Original Audio',
              style: AppTextStyle.poppins(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
