import 'package:get/get.dart';
import 'package:story_view/story_view.dart';

import '../ui/story/story_viewer.dart';
import '../utils/dummy_data.dart';

/// Get-X controller for control [StoryViewerPage]
///
/// handle all queries and variables
class StoriesController extends GetxController {
  /// function to call controller it-self
  ///
  /// Get-x find() function to get instance of controller
  static StoriesController get storiesController => Get.find();

  /// stories
  RxList<StoryItem> storyItems = DummyRepo().storyItems().obs;

  StoryController storyController = StoryController();
}

/// Get-x Binding to bind [StoriesController] to [StoryViewerPage]
class StoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoriesController>(() => StoriesController());
  }
}
