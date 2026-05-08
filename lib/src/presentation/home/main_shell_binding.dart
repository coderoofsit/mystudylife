import 'package:get/get.dart';
import 'main_shell_controller.dart';

class MainShellBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<MainShellController>()) {
      Get.put(MainShellController(), permanent: true);
    }
  }
}
