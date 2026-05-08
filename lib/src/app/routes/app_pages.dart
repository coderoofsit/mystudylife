import 'package:get/get.dart';
import '../../presentation/home/main_shell.dart';
import '../../presentation/home/main_shell_binding.dart';
import '../../presentation/onboarding/onboarding_binding.dart';
import '../../presentation/onboarding/onboarding_screens.dart';
import 'app_routes.dart';

abstract class AppPages {
  static final pages = <GetPage<dynamic>>[
    GetPage(
      name: AppRoutes.privacy,
      page: PrivacyScreen.new,
      binding: OnboardingBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.hub,
      page: ProductivityHubScreen.new,
      binding: OnboardingBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.focus,
      page: ReadyToFocusScreen.new,
      binding: OnboardingBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.signIn,
      page: SignInScreen.new,
      binding: OnboardingBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.onboardingName,
      page: OnboardingNameScreen.new,
      binding: OnboardingBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.onboardingLevel,
      page: OnboardingLevelScreen.new,
      binding: OnboardingBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.onboardingGoals,
      page: OnboardingGoalsScreen.new,
      binding: OnboardingBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.smartSchedule,
      page: SmartScheduleScreen.new,
      binding: OnboardingBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.mainShell,
      page: MainShell.new,
      binding: MainShellBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
