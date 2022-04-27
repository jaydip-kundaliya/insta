import 'package:get/get.dart';

import '../models/reel.dart';
import '../ui/reels/reels_page.dart';
import '../utils/dummy_data.dart';

/// Get-X controller for control [ReelsPage]
///
/// handle all queries and variables
class ReelController extends GetxController {
  /// function to call controller it-self
  ///
  /// Get-x find() function to get instance of controller
  static ReelController get reelController => Get.find();

  RxList<Reel> reels = DummyRepo().reelsItems().obs;
}
