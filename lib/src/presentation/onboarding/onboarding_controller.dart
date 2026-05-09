import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final nameController = TextEditingController(text: 'zain');
  final emailController = TextEditingController(text: 'zainjameel710@gmail.com');
  final passwordController = TextEditingController(text: 'password');

  final levelOptions = const ['Middle School', 'High School', 'University', 'Other'];
  final goalOptions = const [
    ('Achieve higher grades', 'For students focused on academic performance'),
    ('Get organized', 'For students who feel overwhelmed and need clear structure.'),
    ('Build better study habits', 'For students seeking consistency.'),
  ];

  final selectedLevel = 1.obs;
  final selectedGoal = 0.obs;

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
