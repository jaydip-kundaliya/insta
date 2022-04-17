import 'package:get/get.dart';

import '../models/feed_item.dart';
import '../ui/feed/feed_page.dart';
import '../utils/dummy_data.dart';

/// Get-X controller for control [FeedPage]
///
/// handle all queries and variables
class FeedController extends GetxController {
  /// function to call controller it-self
  ///
  /// Get-x find() function to get instance of controller
  static FeedController get feedController => Get.find();

  // total available feed items (offline)
  final RxList<FeedItem> feedItems = DummyRepo().feedItems().obs;
}
