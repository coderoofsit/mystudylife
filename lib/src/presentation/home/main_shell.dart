import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/study_data_controller.dart';
import 'extra_flow_screens.dart';
import 'main_shell_controller.dart';

String _formatTimelineHour(int hour24) {
  final isPm = hour24 >= 12;
  final hour12 = hour24 > 12 ? hour24 - 12 : (hour24 == 0 ? 12 : hour24);
  return '$hour12 ${isPm ? 'PM' : 'AM'}';
}

void _showQuickAddSheet(BuildContext context) {
  void go(Widget screen) {
    Get.back();
    Get.to(() => screen, transition: Transition.cupertino);
  }

  showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (ctx) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text('Quick add', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            ),
            ListTile(
              leading: const Icon(Icons.task_alt_outlined, color: Color(0xFF24C55E)),
              title: const Text('Tasks'),
              onTap: () => go(const TasksScreen()),
            ),
            ListTile(
              leading: const Icon(Icons.class_outlined, color: Color(0xFF24C55E)),
              title: const Text('Classes'),
              onTap: () => go(const ClassesScreen()),
            ),
            ListTile(
              leading: const Icon(Icons.edit_note_outlined, color: Color(0xFF24C55E)),
              title: const Text('Exams'),
              onTap: () => go(const ExamsScreen()),
            ),
            ListTile(
              leading: const Icon(Icons.bolt_outlined, color: Color(0xFF24C55E)),
              title: const Text('Xtra'),
              onTap: () => go(const XtraScreen()),
            ),
            const SizedBox(height: 8),
          ],
        ),
      );
    },
  );
}

class MainShell extends GetView<MainShellController> {
  const MainShell({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = const [
      _HomeDashboardScreen(),
      _TimelineCalendarScreen(),
      _MenuScreen(),
      _ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final horizontal = constraints.maxWidth < 360 ? 10.0 : 16.0;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontal),
              child: Obx(() => IndexedStack(index: controller.selectedIndex.value, children: screens)),
            );
          },
        ),
      ),
      bottomNavigationBar: Obx(
        () => SafeArea(
          top: false,
          child: Container(
            padding: const EdgeInsets.fromLTRB(14, 8, 14, 10),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavIcon(
                  icon: Icons.home_outlined,
                  selected: controller.selectedIndex.value == 0,
                  onTap: () => controller.setIndex(0),
                ),
                _NavIcon(
                  icon: Icons.calendar_today_outlined,
                  selected: controller.selectedIndex.value == 1,
                  onTap: () => controller.setIndex(1),
                ),
                GestureDetector(
                  onTap: () => _showQuickAddSheet(context),
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF24C55E),
                      boxShadow: [BoxShadow(color: Color(0x5524C55E), blurRadius: 10, offset: Offset(0, 4))],
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 32),
                  ),
                ),
                _NavIcon(
                  icon: Icons.grid_view_rounded,
                  selected: controller.selectedIndex.value == 2,
                  onTap: () => controller.setIndex(2),
                ),
                _NavIcon(
                  icon: Icons.account_circle_outlined,
                  selected: controller.selectedIndex.value == 3,
                  onTap: () => controller.setIndex(3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HomeDashboardScreen extends StatelessWidget {
  const _HomeDashboardScreen();

  @override
  Widget build(BuildContext context) {
    final study = Get.find<StudyDataController>();
    // Do not wrap in Obx: home methods read the repository only, not Rx `.value`.
    // Obx with no tracked observables triggers GetX's improper-use assertion.
    final summary = study.homeSummaryCounts();
    final classes = study.homeClassesToday();
    final tasks = study.homeTasksDue();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Spacer(),
                  Column(
                    children: [
                      Text(study.homeWeekdayLabel(), style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24)),
                      Text(study.homeDateLabel(), style: const TextStyle(color: Color(0xFF6B7280), fontSize: 13)),
                    ],
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.search, color: Colors.grey.shade700),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 10,
                runSpacing: 8,
                children: [
                  _PillBadge('${summary.classes} Classes'),
                  _PillBadge('${summary.exams} Exam'),
                  _PillBadge('${summary.tasks} Tasks Due'),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Classes Today', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
              const SizedBox(height: 10),
              ...classes.map(
                (c) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _ClassCard(
                    subject: c.subject,
                    roomTeacher: c.roomTeacher,
                    time: c.time,
                    color: c.color,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              const Text('Tasks Due', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
              const SizedBox(height: 10),
              ...tasks.map(
                (t) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _TaskCard(
                    title: t.title,
                    dueText: t.dueText,
                    trailing: t.trailing,
                    color: t.color,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TimelineCalendarScreen extends StatelessWidget {
  const _TimelineCalendarScreen();

  @override
  Widget build(BuildContext context) {
    final study = Get.find<StudyDataController>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(Icons.menu, color: Colors.grey.shade600, size: 20),
                  onPressed: () => Get.to(
                    () => const CalendarFilterOverlayScreen(),
                    transition: Transition.noTransition,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Obx(() {
                  return Container(
                    height: 48,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () => study.shiftFocusedMonth(-1),
                          icon: const CircleAvatar(
                            radius: 12,
                            backgroundColor: Color(0xFFE4F8EB),
                            child: Icon(Icons.chevron_left, size: 16),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(study.focusedMonthYearLabel(), style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
                        const SizedBox(width: 12),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () => study.shiftFocusedMonth(1),
                          icon: const CircleAvatar(
                            radius: 12,
                            backgroundColor: Color(0xFFE4F8EB),
                            child: Icon(Icons.chevron_right, size: 16),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              const SizedBox(width: 10),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: study.goToToday,
                  child: Container(
                    height: 48,
                    width: 86,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF24C55E)),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Text('Today', style: TextStyle(color: Color(0xFF24C55E), fontWeight: FontWeight.w700, fontSize: 17)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Obx(() => Text(study.focusedWeekdayAbbrev(), style: const TextStyle(color: Color(0xFF24C55E), fontWeight: FontWeight.w700, fontSize: 16))),
          const SizedBox(height: 4),
          Obx(
            () => CircleAvatar(
              radius: 14,
              backgroundColor: const Color(0xFFDFF5E7),
              child: Text(study.focusedDayNumber()),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Obx(() {
              final day = study.focusedDay.value;
              return ListView(
                children: [
                  for (final h in study.timelineHours())
                    _TimeRow(
                      time: _formatTimelineHour(h),
                      event: _buildHourEvents(study, day, h),
                    ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  static Widget? _buildHourEvents(StudyDataController study, DateTime day, int hour) {
    final evs = study.eventsInHour(day, hour);
    if (evs.isEmpty) return null;
    if (evs.length == 1) {
      final e = evs.first;
      return _EventBlock(title: e.title, subtitle: e.subtitle, color: e.color);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: evs
          .map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: _EventBlock(title: e.title, subtitle: e.subtitle, color: e.color),
            ),
          )
          .toList(),
    );
  }
}

class _MenuScreen extends StatelessWidget {
  const _MenuScreen();

  @override
  Widget build(BuildContext context) {
    final tiles = [
      (
        '📋',
        'Tasks',
        () => Get.to(
          () => TasksScreen(
            next: () => Get.to(
              () => ClassesScreen(
                next: () => Get.to(
                  () => ExamsScreen(
                    next: () => Get.to(
                      () => VacationsScreen(
                        next: () => Get.to(() => const PersonalizeScreen(), transition: Transition.cupertino),
                      ),
                      transition: Transition.cupertino,
                    ),
                  ),
                  transition: Transition.cupertino,
                ),
              ),
              transition: Transition.cupertino,
            ),
          ),
          transition: Transition.cupertino,
        ),
      ),
      ('📚', 'Classes', () => Get.to(() => const ClassesScreen(), transition: Transition.cupertino)),
      ('✍️', 'Exams', () => Get.to(() => const ExamsScreen(), transition: Transition.cupertino)),
      ('🏝️', 'Vacations', () => Get.to(() => const VacationsScreen(), transition: Transition.cupertino)),
      (
        '⚡',
        'Xtra',
        () => Get.to(
          () => XtraScreen(
            next: () => Get.to(
              () => ICalIntroScreen(
                next: () => Get.to(
                  () => CalendarSyncScreen(
                    next: () => Get.to(
                      () => SettingsScreen(
                        next: () => Get.to(
                          () => ScheduleSetupScreen(
                            next: () => Get.to(
                              () => PersonalizeScreen(
                                next: () => Get.to(
                                  () => RemindersScreen(
                                    next: () => Get.to(() => const ManageSubjectsScreen(), transition: Transition.cupertino),
                                  ),
                                  transition: Transition.cupertino,
                                ),
                              ),
                              transition: Transition.cupertino,
                            ),
                          ),
                          transition: Transition.cupertino,
                        ),
                      ),
                      transition: Transition.cupertino,
                    ),
                  ),
                  transition: Transition.cupertino,
                ),
              ),
              transition: Transition.cupertino,
            ),
          ),
          transition: Transition.cupertino,
        ),
      ),
      (
        '⏳',
        'Focus Timer',
        () => Get.snackbar('Focus Timer', 'Coming soon — connect your study session flow here.'),
      ),
      (
        '📷',
        'Ai Schedule\nScan',
        () => Get.snackbar('AI Schedule Scan', 'Coming soon — wire to camera / OCR pipeline.'),
      ),
      ('🔗', 'Calendar\nSync', () => Get.to(() => const CalendarSyncScreen(), transition: Transition.cupertino)),
      ('🛠️', 'Settings', () => Get.to(() => const SettingsScreen(), transition: Transition.cupertino)),
      ('📅', 'Schedule Set\nUp', () => Get.to(() => const ScheduleSetupScreen(), transition: Transition.cupertino)),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
            const Text('Menu', style: TextStyle(fontSize: 42, fontWeight: FontWeight.w700)),
            const SizedBox(height: 14),
            Expanded(
              child: GridView.builder(
                itemCount: tiles.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.88,
                ),
                itemBuilder: (_, index) {
                  final item = tiles[index];
                  return GestureDetector(
                    onTap: item.$3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8)],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(item.$1, style: const TextStyle(fontSize: 34)),
                          const SizedBox(height: 10),
                          Text(item.$2, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

class _ProfileScreen extends StatelessWidget {
  const _ProfileScreen();

  @override
  Widget build(BuildContext context) {
    final study = Get.find<StudyDataController>();
    final p = study.userProfile;
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 14),
      child: Column(
        children: [
            Row(
              children: [
                const Spacer(),
                const Text('Profile', style: TextStyle(fontSize: 42, fontWeight: FontWeight.w700)),
                const Spacer(),
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () => Get.to(() => const PersonalizeScreen(), transition: Transition.cupertino),
                    icon: Icon(Icons.edit_outlined, color: Colors.grey.shade700, size: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: 130,
              height: 130,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF2CC56A), width: 3, style: BorderStyle.solid),
              ),
              child: const Text('Profile Picture', style: TextStyle(color: Color(0xFF2CC56A), fontWeight: FontWeight.w700)),
            ),
            const SizedBox(height: 10),
            Text(p.displayName, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700)),
            Text(p.email, style: const TextStyle(fontSize: 14, color: Color(0xFF4F5962))),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: _StatsCard(
                    title: '👀 Pending Tasks',
                    value: '${p.pendingTasksNext7Days}',
                    note: 'Next 7 Days',
                    bg: const Color(0xFFFFF7DF),
                    valueColor: const Color(0xFFE0A70D),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _StatsCard(
                    title: '⚠️ Overdue Tasks',
                    value: '${p.overdueTasks}',
                    note: 'Total',
                    bg: const Color(0xFFFFEEF1),
                    valueColor: const Color(0xFFE64963),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _StatsCard(
                    title: '👍 Tasks Completed',
                    value: '${p.tasksCompletedLast7Days}',
                    note: 'Last 7 Days',
                    bg: const Color(0xFFE7F8EC),
                    valueColor: const Color(0xFF23C15A),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _StatsCard(
                    title: '🔥 Your Streak',
                    value: '${p.streakDays}',
                    note: 'Total streak',
                    bg: const Color(0xFFF3EEFF),
                    valueColor: const Color(0xFFA55DF8),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const _ActionRow(title: '👑 Premium Subscription'),
            const SizedBox(height: 8),
            const _ActionRow(title: '⤴️ Log out'),
            const SizedBox(height: 16),
            const Text('Delete Account', style: TextStyle(color: Color(0xFFE75A6D), fontWeight: FontWeight.w700, fontSize: 18)),
            const SizedBox(height: 2),
            Text(p.appVersionLabel, style: const TextStyle(color: Color(0xFF626B75), fontSize: 15)),
          ],
        ),
      );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon({required this.icon, required this.selected, required this.onTap});

  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(icon, color: selected ? const Color(0xFF24C55E) : const Color(0xFFADB0B4)),
    );
  }
}

class _PillBadge extends StatelessWidget {
  const _PillBadge(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(color: const Color(0xFFDFF5E8), borderRadius: BorderRadius.circular(30)),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF2D8C5D))),
    );
  }
}

class _ClassCard extends StatelessWidget {
  const _ClassCard({required this.subject, required this.roomTeacher, required this.time, required this.color});
  final String subject;
  final String roomTeacher;
  final String time;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: [
          Container(width: 5, height: 44, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(99))),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(subject, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                Text(roomTeacher, style: const TextStyle(color: Color(0xFF6B7280), fontSize: 12)),
              ],
            ),
          ),
          Text(time, style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF39414B))),
        ],
      ),
    );
  }
}

class _TaskCard extends StatelessWidget {
  const _TaskCard({required this.title, required this.dueText, required this.trailing, required this.color});
  final String title;
  final String dueText;
  final String trailing;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: [
          Container(width: 5, height: 44, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(99))),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                Text(dueText, style: const TextStyle(color: Color(0xFF6B7280), fontSize: 12)),
              ],
            ),
          ),
          Text(trailing, style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF39414B))),
        ],
      ),
    );
  }
}

class _TimeRow extends StatelessWidget {
  const _TimeRow({required this.time, this.event});
  final String time;
  final Widget? event;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB)))),
      child: Row(
        children: [
          SizedBox(width: 50, child: Text(time, style: const TextStyle(fontSize: 16, color: Color(0xFF4B5563)))),
          const SizedBox(width: 8),
          Expanded(child: event ?? const SizedBox.shrink()),
        ],
      ),
    );
  }
}

class _EventBlock extends StatelessWidget {
  const _EventBlock({required this.title, required this.subtitle, required this.color});
  final String title;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 9),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
          Text(
            subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white70, fontSize: 12, height: 1.0),
          ),
        ],
      ),
    );
  }
}

class _StatsCard extends StatelessWidget {
  const _StatsCard({required this.title, required this.value, required this.note, required this.bg, required this.valueColor});
  final String title;
  final String value;
  final String note;
  final Color bg;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700, color: valueColor)),
          Text(note, style: const TextStyle(color: Color(0xFF5A6370), fontSize: 12)),
        ],
      ),
    );
  }
}

class _ActionRow extends StatelessWidget {
  const _ActionRow({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
          const Spacer(),
          const Icon(Icons.chevron_right, color: Color(0xFF24C55E)),
        ],
      ),
    );
  }
}
