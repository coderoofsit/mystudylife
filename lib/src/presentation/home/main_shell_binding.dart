import 'package:get/get.dart';

import '../../data/study_dummy_repository.dart';
import '../../data/study_repository.dart';
import '../controllers/study_data_controller.dart';
import 'main_shell_controller.dart';

class MainShellBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<MainShellController>()) {
      Get.put(MainShellController(), permanent: true);
    }
    if (!Get.isRegistered<StudyRepository>()) {
      Get.put<StudyRepository>(StudyDummyRepository(), permanent: true);
    }
    if (!Get.isRegistered<StudyDataController>()) {
      Get.put(StudyDataController(Get.find<StudyRepository>()), permanent: true);
    }
  }
}
