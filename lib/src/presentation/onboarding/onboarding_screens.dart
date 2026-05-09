import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/routes/app_routes.dart';
import 'onboarding_controller.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF24C55E),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    const Center(
                      child: Text(
                        'Privacy & Data',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Center(child: Text('🎓', style: TextStyle(fontSize: 44))),
                    const SizedBox(height: 8),
                    const Center(
                      child: Text('Success Road', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700, color: Colors.white)),
                    ),
                    const SizedBox(height: 20),
                    const Text('We care about your privacy', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    const Text(
                      'We want to be transparent about how we use your data to improve your experience and keep Success Road free.',
                      style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.45),
                    ),
                    const SizedBox(height: 18),
                    const Text('What we collect', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    const _Bullet('App usage analytics to improve features'),
                    const _Bullet('Device information for compatibility'),
                    const _Bullet('Optional: Personalized ad preferences'),
                    const SizedBox(height: 14),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white24),
                      ),
                      child: const Row(
                        children: [
                          CircleAvatar(radius: 16, backgroundColor: Colors.white, child: Text('🛡️')),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Your data is safe', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
                                SizedBox(height: 4),
                                Text(
                                  'We never sell your personal information and follow strict privacy standards.',
                                  style: TextStyle(color: Colors.white70, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () => Get.toNamed(AppRoutes.hub),
                        child: const Text('Continue', style: TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductivityHubScreen extends StatelessWidget {
  const ProductivityHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF48D97D), Color(0xFF20B256)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('◀', style: TextStyle(fontSize: 16, color: Colors.white)),
                        SizedBox(width: 8),
                        Text('Success Road', style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.w700)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 320,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: const [
                          Positioned(
                            left: -40,
                            top: 36,
                            child: _TiltedHubTile(title: 'Task', emoji: '📋', color: Color(0xFF2BD3DD), angle: -0.12),
                          ),
                          Positioned(
                            left: 118,
                            top: 20,
                            child: _TiltedHubTile(title: 'Class', emoji: '📚', color: Color(0xFFB968FF), angle: -0.12),
                          ),
                          Positioned(
                            right: -35,
                            top: 5,
                            child: _TiltedHubTile(title: '', emoji: '📝', color: Color(0xFF47DBE2), angle: -0.12),
                          ),
                          Positioned(
                            left: -56,
                            top: 120,
                            child: _TiltedHubTile(title: 'Holiday', emoji: '🏝️', color: Color(0xFFFF9C3A), angle: -0.12),
                          ),
                          Positioned(
                            left: 129,
                            top: 100,
                            child: _TiltedHubTile(title: 'Exam', emoji: '📋', color: Color(0xFF62DE97), angle: -0.12),
                          ),
                          Positioned(
                            right: -48,
                            top: 85,
                            child: _TiltedHubTile(title: '', emoji: '📅', color: Color(0xFFFF9C3A), angle: -0.12),
                          ),
                          Positioned(
                            left: -30,
                            top: 210,
                            child: _TiltedHubTile(title: 'Xtra', emoji: '⚡', color: Color(0xFFC8F266), angle: -0.12),
                          ),
                          Positioned(
                            left: 132,
                            top: 190,
                            child: _TiltedHubTile(title: 'Pomodoro', emoji: '⏳', color: Color(0xFFF77BC6), angle: -0.12),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'The Ultimate Student\nProductivity Hub',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Join millions of students around the world who plan smarter, stay focused.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Get.toNamed(AppRoutes.focus),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: const Text('Get Started', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700, color: Color(0xFF24C55E))),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ReadyToFocusScreen extends StatelessWidget {
  const ReadyToFocusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F2),
      body: Column(
        children: [
          Expanded(
            flex: 44,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFA9E6C8), Color(0xFF53D78B)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: const Center(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.fromBorderSide(BorderSide(width: 5, color: Colors.white70)),
                  ),
                  child: SizedBox(
                    width: 220,
                    height: 190,
                    child: Center(child: Text('📋 ✨', style: TextStyle(fontSize: 52))),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 56,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
              decoration: const BoxDecoration(
                color: Color(0xFFF4F4F4),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(22), topRight: Radius.circular(22)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(radius: 18, backgroundColor: Color(0xFF24C55E), child: Text('🎓')),
                      SizedBox(width: 10),
                      Text('My Study Life', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Ready to stay focused, get organized, and achieve more?',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, height: 1.2),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Beat procrastination, stay on track, and study smarter - with the productivity tool trusted by over 24 million students worldwide.',
                    style: TextStyle(fontSize: 15, color: Color(0xFF565D66), height: 1.4),
                  ),
                  const SizedBox(height: 12),
                  _PrimaryButton(label: "I'm a student", onTap: () => Get.toNamed(AppRoutes.signIn)),
                  const SizedBox(height: 12),
                  _PrimaryOutlineButton(label: "I'm a parent/guardian", onTap: () => Get.toNamed(AppRoutes.signIn)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();

    return Scaffold(
      backgroundColor: const Color(0xFF24C55E),

      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            /// TOP GREEN SECTION
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 30),
              child: const Column(
                children: [
                  Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(
                    'Success Road',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            /// BOTTOM CARD
            Positioned(
              top: 180,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F6F6),

                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),

                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      offset: const Offset(0, -4),
                      color: Colors.black.withValues(alpha: 0.08),
                    ),
                  ],
                ),

                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(22, 28, 22, 20),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'Welcome back!',
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      const SizedBox(height: 4),

                      const Center(
                        child: Text(
                          "Let's keep the momentum going.",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF74797F),
                          ),
                        ),
                      ),

                      const SizedBox(height: 22),

                      const Text(
                        'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),

                      const SizedBox(height: 8),

                      _StyledTextField(
                        controller: controller.emailController,
                      ),

                      const SizedBox(height: 14),

                      const Text(
                        'Password',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),

                      const SizedBox(height: 8),

                      _StyledTextField(
                        controller: controller.passwordController,
                        obscureText: true,
                      ),

                      const SizedBox(height: 10),

                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color(0xFF24C55E),
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      _PrimaryButton(
                        label: 'Continue',
                        onTap: () =>
                            Get.toNamed(AppRoutes.onboardingName),
                      ),

                      const SizedBox(height: 14),

                      Row(
                        children: [
                          const Expanded(child: Divider()),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Text(
                              'or sign in with',
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 17,
                              ),
                            ),
                          ),

                          const Expanded(child: Divider()),
                        ],
                      ),

                      const SizedBox(height: 14),

                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _SocialIcon(text: '🍎'),
                          SizedBox(width: 14),
                          _SocialIcon(text: 'G'),
                        ],
                      ),

                      const SizedBox(height: 14),

                      const Center(
                        child: Text.rich(
                          TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                              color: Color(0xFF494F56),
                              fontSize: 19,
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign up',
                                style: TextStyle(
                                  color: Color(0xFF24C55E),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class OnboardingNameScreen extends StatelessWidget {
  const OnboardingNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();
    return Scaffold(
      backgroundColor: const Color(0xFFE8F6EC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _OnboardingHeader(step: 1, onSkip: () => Get.toNamed(AppRoutes.smartSchedule)),
              const SizedBox(height: 20),
              const Center(child: Text('🏅', style: TextStyle(fontSize: 62))),
              const SizedBox(height: 14),
              const Center(
                child: Text(
                  '100,000+\n5-Star Reviews',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 38, fontWeight: FontWeight.w700, height: 1.1),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Trusted by students in 180+ countries to stay organized, stress less, and boost their grades.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Color(0xFF5C6066)),
                ),
              ),
              const SizedBox(height: 14),
              const Text("What's your name? 👋", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              _StyledTextField(controller: controller.nameController),
              const Spacer(),
              _PrimaryButton(label: 'Continue', onTap: () => Get.toNamed(AppRoutes.onboardingLevel)),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingLevelScreen extends StatelessWidget {
  const OnboardingLevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();
    return Scaffold(
      backgroundColor: const Color(0xFFE8F6EC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _OnboardingHeader(step: 2, onSkip: () => Get.toNamed(AppRoutes.smartSchedule)),
                const SizedBox(height: 16),
                const Text('What kind of student are you?', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                const Text('So we can build your planner around the way you learn.', style: TextStyle(fontSize: 16, color: Color(0xFF586169))),
                const SizedBox(height: 12),
                for (var i = 0; i < controller.levelOptions.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: _SelectCard(
                      selected: controller.selectedLevel.value == i,
                      title: controller.levelOptions[i],
                      onTap: () => controller.selectedLevel.value = i,
                    ),
                  ),
                const SizedBox(height: 4),
                const Text('Backed by the media, loved by students', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
                const SizedBox(height: 6),
                const Text('Forbes    Hindustan Times    HER CAMPUS', style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic, color: Color(0xFF30363C))),
                const Spacer(),
                _PrimaryButton(label: 'Continue', onTap: () => Get.toNamed(AppRoutes.onboardingGoals)),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardingGoalsScreen extends StatelessWidget {
  const OnboardingGoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();
    return Scaffold(
      backgroundColor: const Color(0xFFE8F6EC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _OnboardingHeader(step: 3, onSkip: () => Get.toNamed(AppRoutes.smartSchedule)),
                const SizedBox(height: 16),
                const Text('What do you want to achieve?', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                const Text(
                  "We'll personalise Success Road to help you work smarter and achieve what matters most.",
                  style: TextStyle(fontSize: 16, color: Color(0xFF586169)),
                ),
                const SizedBox(height: 12),
                for (var i = 0; i < controller.goalOptions.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: _SelectCard(
                      selected: controller.selectedGoal.value == i,
                      title: controller.goalOptions[i].$1,
                      subtitle: controller.goalOptions[i].$2,
                      onTap: () => controller.selectedGoal.value = i,
                    ),
                  ),
                const Spacer(),
                _PrimaryButton(label: 'Continue', onTap: () => Get.toNamed(AppRoutes.smartSchedule)),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SmartScheduleScreen extends StatefulWidget {
  const SmartScheduleScreen({super.key});

  @override
  State<SmartScheduleScreen> createState() => _SmartScheduleScreenState();
}

class _SmartScheduleScreenState extends State<SmartScheduleScreen> {
  bool _scheduled = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_scheduled) return;
    _scheduled = true;
    Future<void>.delayed(const Duration(milliseconds: 1700), () {
      if (!mounted) return;
      Get.offAllNamed(AppRoutes.mainShell);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F6EC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
          child: Column(
            children: [
              const Spacer(),
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 10, offset: const Offset(0, 4)),
                  ],
                ),
                child: Center(
                  child: Container(
                    width: 84,
                    height: 84,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [const Color(0xFF7DECA5), const Color(0xFF24C55E).withValues(alpha: 0.75)]),
                    ),
                    child: const Center(child: Text('🎓', style: TextStyle(fontSize: 30))),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const LinearProgressIndicator(
                value: 0.62,
                minHeight: 10,
                borderRadius: BorderRadius.all(Radius.circular(999)),
                backgroundColor: Color(0xFFD6EDDE),
                valueColor: AlwaysStoppedAnimation(Color(0xFF24C55E)),
              ),
              const SizedBox(height: 12),
              const Text("Hang tight - it won't take long!", style: TextStyle(fontSize: 18, color: Color(0xFF4D545C))),
              const SizedBox(height: 12),
              const Text(
                'Smart schedule\nin progress...',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700, height: 1.08),
              ),
              const SizedBox(height: 12),
              const Text(
                "We're putting together your personalized planner - just for you.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Color(0xFF4D545C)),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardingHeader extends StatelessWidget {
  const _OnboardingHeader({required this.step, required this.onSkip});

  final int step;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton.filledTonal(
              onPressed: Get.back,
              style: IconButton.styleFrom(backgroundColor: Colors.white, minimumSize: const Size(40, 40)),
              icon: const Icon(Icons.chevron_left),
            ),
            const SizedBox(width: 8),
            const Expanded(
              child: Text('Welcome to Success Road!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            ),
            TextButton(
              onPressed: onSkip,
              child: const Text('Skip', style: TextStyle(color: Color(0xFF24C55E), fontWeight: FontWeight.w700)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: List.generate(
            4,
            (index) => Expanded(
              child: Container(
                margin: EdgeInsets.only(right: index < 3 ? 6 : 0),
                height: 5,
                decoration: BoxDecoration(
                  color: index < step ? const Color(0xFF24C55E) : const Color(0xFFD4D9DB),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text('$step of 4', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF424A52))),
      ],
    );
  }
}

class _TiltedHubTile extends StatelessWidget {
  const _TiltedHubTile({
    required this.title,
    required this.emoji,
    required this.color,
    required this.angle,
  });

  final String title;
  final String emoji;
  final Color color;
  final double angle;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: title.isEmpty ? 0 : 25, vertical: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(22),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Center(child: Text(emoji, style: const TextStyle(fontSize: 22))),
            ),
            if (title.isNotEmpty) ...[
              const SizedBox(width: 10),
              Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white)),
            ],
          ],
        ),
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  const _Bullet(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text('• $text', style: const TextStyle(color: Colors.white70, fontSize: 16)),
    );
  }
}

class _StyledTextField extends StatelessWidget {
  const _StyledTextField({required this.controller, this.obscureText = false});

  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(fontSize: 22),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF1F1F1),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF24C55E), width: 1.5),
        ),
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  const _SocialIcon({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFD8D8D8)),
      ),
      child: Center(child: Text(text, style: const TextStyle(fontSize: 28))),
    );
  }
}

class _SelectCard extends StatelessWidget {
  const _SelectCard({required this.selected, required this.title, this.subtitle, required this.onTap});

  final bool selected;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF24C55E) : const Color(0xFFE0F8E9),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: Colors.white.withValues(alpha: 0.9),
              child: Icon(Icons.check, size: 16, color: selected ? const Color(0xFF24C55E) : const Color(0xFF2DB86A)),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: selected ? Colors.white : const Color(0xFF1C2228),
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle!,
                      style: TextStyle(color: selected ? Colors.white70 : const Color(0xFF5A626A), fontSize: 13),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: const Color(0xFF24C55E),
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        child: Text(label, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700)),
      ),
    );
  }
}

class _PrimaryOutlineButton extends StatelessWidget {
  const _PrimaryOutlineButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFF24C55E)),
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        child: Text(label, style: const TextStyle(fontSize: 19, color: Color(0xFF24C55E), fontWeight: FontWeight.w700)),
      ),
    );
  }
}
