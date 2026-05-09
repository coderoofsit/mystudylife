import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/study_repository.dart';
import '../../domain/models/study_models.dart';
import '../controllers/study_data_controller.dart';
import '../widgets/study_list_cards.dart';
import '../widgets/study_ui_kit.dart';

class CalendarFilterOverlayScreen extends StatelessWidget {
  const CalendarFilterOverlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final study = Get.find<StudyDataController>();
    return Scaffold(
      backgroundColor: const Color(0xFF8F8F8F),
      body: SafeArea(
        child: Row(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 0.68,
              color: const Color(0xFFF4F5F7),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 10, 14, 8),
                child: Obx(() {
                  final mode = study.calendarViewMode.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6),
                      _OverlayTodayButton(onTap: Get.back),
                      const SizedBox(height: 14),
                      ...CalendarViewMode.values.map(
                        (m) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: _SelectableModeRow(
                            label: m.name[0].toUpperCase() + m.name.substring(1),
                            selected: mode == m,
                            onTap: () => study.calendarViewMode.value = m,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 8),
                      ...CalendarFilterType.values.map(
                        (f) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: _SelectableFilterRow(
                            color: f.color,
                            title: f.label,
                            selected: study.calendarFilterActive(f),
                            onTap: () => study.toggleCalendarFilter(f),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: Get.back,
                child: Container(color: Colors.transparent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key, this.next});
  final VoidCallback? next;

  @override
  Widget build(BuildContext context) {
    final c = Get.find<StudyDataController>();
    return _DetailScaffold(
      title: 'Tasks',
      next: next,
      child: Obx(() {
        return Column(
          children: [
            SegmentTabControl(
              labels: const ['Current', 'Past', 'Overdue'],
              selectedIndex: TaskBucket.values.indexOf(c.taskSegment.value),
              onChanged: (i) => c.taskSegment.value = TaskBucket.values[i],
            ),
            const SizedBox(height: 12),
            StudyStyledDropdown<String>(
              value: c.selectedTaskSubjectId.value,
              items: c.taskSubjectDropdown
                  .map((o) => DropdownMenuItem<String>(value: o.id, child: Text(o.label)))
                  .toList(),
              onChanged: (v) => c.selectedTaskSubjectId.value = v ?? 'all',
            ),
            const SizedBox(height: 12),
            ...c.filteredTasks.map(
              (t) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: StudyListItemCard(
                  title: t.title,
                  subtitle: t.subtitle,
                  right: t.right,
                  chip: t.chip,
                  accentColor: t.accentColor,
                  chipTint: t.chipTint,
                  chipText: t.chipText,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class ClassesScreen extends StatelessWidget {
  const ClassesScreen({super.key, this.next});
  final VoidCallback? next;

  @override
  Widget build(BuildContext context) {
    final c = Get.find<StudyDataController>();
    return _DetailScaffold(
      title: 'Classes',
      next: next,
      child: Obx(() {
        return Column(
          children: [
            SegmentTabControl(
              labels: const ['Current', 'Past'],
              selectedIndex: ClassExamBucket.values.indexOf(c.classSegment.value),
              onChanged: (i) => c.classSegment.value = ClassExamBucket.values[i],
            ),
            const SizedBox(height: 12),
            StudyStyledDropdown<String>(
              value: c.selectedClassSubjectId.value,
              items: [
                const DropdownMenuItem(value: 'all', child: Text('All Subjects')),
                ...c.filterSubjects.map((s) => DropdownMenuItem(value: s.id, child: Text(s.name))),
              ],
              onChanged: (v) => c.selectedClassSubjectId.value = v ?? 'all',
            ),
            const SizedBox(height: 12),
            ...c.filteredClasses.map(
              (cl) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: StudyListItemCard(
                  title: cl.title,
                  subtitle: cl.subtitle,
                  right: cl.right,
                  chip: cl.chip,
                  accentColor: cl.accentColor,
                  chipTint: cl.chipTint,
                  chipText: cl.chipText,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class ExamsScreen extends StatelessWidget {
  const ExamsScreen({super.key, this.next});
  final VoidCallback? next;

  @override
  Widget build(BuildContext context) {
    final c = Get.find<StudyDataController>();
    return _DetailScaffold(
      title: 'Exams',
      next: next,
      child: Obx(() {
        return Column(
          children: [
            SegmentTabControl(
              labels: const ['Current', 'Past'],
              selectedIndex: ClassExamBucket.values.indexOf(c.examSegment.value),
              onChanged: (i) => c.examSegment.value = ClassExamBucket.values[i],
            ),
            const SizedBox(height: 12),
            StudyStyledDropdown<String>(
              value: c.selectedExamSubjectId.value,
              items: [
                const DropdownMenuItem(value: 'all', child: Text('All Subjects')),
                ...c.filterSubjects.map((s) => DropdownMenuItem(value: s.id, child: Text(s.name))),
              ],
              onChanged: (v) => c.selectedExamSubjectId.value = v ?? 'all',
            ),
            const SizedBox(height: 12),
            ...c.filteredExams.map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: StudyListItemCard(
                  title: e.title,
                  subtitle: e.subtitle,
                  right: e.right,
                  chip: e.chip,
                  accentColor: e.accentColor,
                  chipTint: e.chipTint,
                  chipText: e.chipText,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class VacationsScreen extends StatelessWidget {
  const VacationsScreen({super.key, this.next});
  final VoidCallback? next;

  @override
  Widget build(BuildContext context) {
    final c = Get.find<StudyDataController>();
    return _DetailScaffold(
      title: 'Vacations',
      next: next,
      child: Obx(() {
        return Column(
          children: [
            SegmentTabControl(
              labels: const ['Upcoming', 'Past'],
              selectedIndex: VacationBucket.values.indexOf(c.vacationSegment.value),
              onChanged: (i) => c.vacationSegment.value = VacationBucket.values[i],
            ),
            const SizedBox(height: 12),
            ...c.filteredVacations.map(
              (v) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: StudyListItemCard(
                  title: v.title,
                  subtitle: v.subtitle,
                  right: v.right,
                  chip: v.chip,
                  accentColor: v.accentColor,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class PersonalizeScreen extends StatelessWidget {
  const PersonalizeScreen({super.key, this.next});
  final VoidCallback? next;

  @override
  Widget build(BuildContext context) {
    final c = Get.find<StudyDataController>();
    return _DetailScaffold(
      title: 'Personalize',
      next: next,
      child: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Which country are you from? 👑', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 6),
            const Text(
              'If you want to, let us know where you are from so we can suggest the most relevant personalization.',
              style: TextStyle(fontSize: 14, color: Color(0xFF5D6670)),
            ),
            const SizedBox(height: 10),
            StudyStyledDropdown<int>(
              value: c.personalizeCountryIndex.value.clamp(0, c.countryOptions.length - 1),
              items: [
                for (var i = 0; i < c.countryOptions.length; i++)
                  DropdownMenuItem(value: i, child: Text(c.countryOptions[i])),
              ],
              onChanged: (v) {
                if (v != null) c.personalizeCountryIndex.value = v;
              },
            ),
            const SizedBox(height: 16),
            const Text('Date format you prefer', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            StudyChoiceChipGroup(
              labels: const ['Jan 1, 2022', '1 Jan, 2022', '2022, Jan 1'],
              selectedIndex: c.personalizeDateFormatIndex.value,
              onChanged: (i) => c.personalizeDateFormatIndex.value = i,
            ),
            const SizedBox(height: 14),
            const Text('Time format you prefer', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            StudyChoiceChipGroup(
              labels: const ['12 hrs (Eg. 3pm)', '24 hrs (Eg. 15:00)'],
              selectedIndex: c.personalizeTimeFormatIndex.value,
              onChanged: (i) => c.personalizeTimeFormatIndex.value = i,
            ),
            const SizedBox(height: 14),
            const Text('Days to display on the dashboard', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            StudyChoiceChipGroup(
              labels: const ['1', '2', '3', '4', '5'],
              selectedIndex: c.personalizeDashboardDaysIndex.value,
              outlined: true,
              onChanged: (i) => c.personalizeDashboardDaysIndex.value = i,
            ),
            const SizedBox(height: 14),
            const Text('Task completion confetti', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            StudyChoiceChipGroup(
              labels: const ['On', 'Off'],
              selectedIndex: c.personalizeConfettiOn.value ? 0 : 1,
              onChanged: (i) => c.personalizeConfettiOn.value = i == 0,
            ),
            const SizedBox(height: 14),
            const Text('Show completed tasks on the dashboard', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            StudyChoiceChipGroup(
              labels: const ['Show', 'Hide 🗑️'],
              selectedIndex: c.personalizeShowCompletedTasks.value ? 0 : 1,
              onChanged: (i) => c.personalizeShowCompletedTasks.value = i == 0,
            ),
          ],
        );
      }),
    );
  }
}

class XtraScreen extends StatelessWidget {
  const XtraScreen({super.key, this.next});
  final VoidCallback? next;

  @override
  Widget build(BuildContext context) {
    final c = Get.find<StudyDataController>();
    return _DetailScaffold(
      title: 'Xtra',
      next: next,
      child: Obx(() {
        return Column(
          children: [
            SegmentTabControl(
              labels: const ['Academic', 'Non-Academic'],
              selectedIndex: XtraBucket.values.indexOf(c.xtraSegment.value),
              onChanged: (i) => c.xtraSegment.value = XtraBucket.values[i],
            ),
            const SizedBox(height: 14),
            ...c.filteredXtra.map(
              (x) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: StudyXtraListCard(
                  emoji: x.emoji,
                  title: x.title,
                  subtitle: x.subtitle,
                  time: x.time,
                  chip: x.chip,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class ICalIntroScreen extends StatelessWidget {
  const ICalIntroScreen({super.key, this.next});
  final VoidCallback? next;

  @override
  Widget build(BuildContext context) {
    return _DetailScaffold(
      title: 'iCal',
      next: next,
      backgroundColor: const Color(0xFFDDF5E4),
      child: Column(
        children: [
          const SizedBox(height: 18),
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.75),
              borderRadius: BorderRadius.circular(36),
              border: Border.all(color: const Color(0xFF9BE0B5)),
              boxShadow: [BoxShadow(color: Colors.green.withValues(alpha: 0.18), blurRadius: 16)],
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                const Center(child: Icon(Icons.calendar_month_outlined, size: 58, color: Color(0xFF83A98E))),
                Positioned(
                  right: -6,
                  top: -6,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: const Color(0xFF24C55E),
                    child: const Icon(Icons.sync, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Connect your schedule with\nCalendar Sync 🔁',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
          ),
          const SizedBox(height: 14),
          const Text(
            'Easily connect Success Road to your school, university,\nor personal calendar to keep your MSL schedule up to date automatically.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF4B5563), height: 1.4),
          ),
          const SizedBox(height: 10),
          const Text(
            'Simply download your iCal link and upload it here. Any changes to your calendar will sync instantly with Success Road.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF4B5563), height: 1.4),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: next,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF24C55E),
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text('Setup iCal', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 24)),
            ),
          ),
        ],
      ),
    );
  }
}

class CalendarSyncScreen extends StatefulWidget {
  const CalendarSyncScreen({super.key, this.next});
  final VoidCallback? next;

  @override
  State<CalendarSyncScreen> createState() => _CalendarSyncScreenState();
}

class _CalendarSyncScreenState extends State<CalendarSyncScreen> {
  late final TextEditingController _title;
  late final TextEditingController _url;

  @override
  void initState() {
    super.initState();
    final s = Get.find<StudyDataController>();
    _title = TextEditingController(text: s.syncTitleController.value);
    _url = TextEditingController(text: s.syncUrlController.value);
  }

  @override
  void dispose() {
    _title.dispose();
    _url.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = Get.find<StudyDataController>();
    return _DetailScaffold(
      title: 'Calendar Sync',
      next: widget.next,
      backgroundColor: const Color(0xFFDDF5E4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('1. Get your iCal link', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          const Text(
            'Copy the iCal URL from your calendar provider and paste it into Success Road to sync your schedule.',
            style: TextStyle(color: Color(0xFF4B5563)),
          ),
          const SizedBox(height: 10),
          Obx(
            () => StudyStyledDropdown<int>(
              value: c.calendarProviderIndex.value.clamp(0, c.calendarProviderOptions.length - 1),
              items: [
                for (var i = 0; i < c.calendarProviderOptions.length; i++)
                  DropdownMenuItem(value: i, child: Text(c.calendarProviderOptions[i])),
              ],
              onChanged: (v) {
                if (v != null) c.calendarProviderIndex.value = v;
              },
            ),
          ),
          const SizedBox(height: 8),
          const Text.rich(
            TextSpan(
              text: "Can't find your calendar type? ",
              style: TextStyle(fontWeight: FontWeight.w700),
              children: [TextSpan(text: 'Check this guide', style: TextStyle(color: Color(0xFF239D60), decoration: TextDecoration.underline))],
            ),
          ),
          const SizedBox(height: 16),
          const Text('2. Paste the link here', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          const SizedBox(height: 10),
          const Text('Title*', style: TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          StudyStyledTextField(
            controller: _title,
            onChanged: (t) => c.syncTitleController.value = t,
          ),
          const SizedBox(height: 12),
          const Text('URL*', style: TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          StudyStyledTextField(
            controller: _url,
            minLines: 3,
            maxLines: 5,
            keyboardType: TextInputType.url,
            onChanged: (u) => c.syncUrlController.value = u,
          ),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key, this.next});
  final VoidCallback? next;

  @override
  Widget build(BuildContext context) {
    return _DetailScaffold(
      title: 'Settings',
      next: next,
      child: Column(
        children: [
          _SettingsSection(
            children: [
              _SettingsRow(title: 'Schedule Setup', icon: '📋', onTap: () => Get.to(() => const ScheduleSetupScreen(), transition: Transition.cupertino)),
              _SettingsRow(title: 'Personalize', icon: '👤', onTap: () => Get.to(() => const PersonalizeScreen(), transition: Transition.cupertino)),
              _SettingsRow(title: 'Reminders', icon: '🔔', onTap: () => Get.to(() => const RemindersScreen(), transition: Transition.cupertino)),
              _SettingsRow(title: 'Manage Subjects', icon: '📚', onTap: () => Get.to(() => const ManageSubjectsScreen(), transition: Transition.cupertino)),
            ],
          ),
          const SizedBox(height: 10),
          _SettingsSection(
            children: [
              _SettingsRow(
                title: 'Support',
                icon: '💬',
                onTap: () => Get.to(
                  () => HelpIntroScreen(
                    next: () => Get.to(
                      () => HelpExpandedScreen(
                        next: () => Get.to(() => const PremiumOfferScreen(), transition: Transition.cupertino),
                      ),
                      transition: Transition.cupertino,
                    ),
                  ),
                  transition: Transition.cupertino,
                ),
              ),
              _SettingsRow(title: 'About', icon: 'ⓘ'),
              _DarkModeToggleRow(),
            ],
          ),
          const SizedBox(height: 10),
          const _SettingsSection(
            children: [
              _SettingsRow(title: 'Clear Account Data', icon: '🧹'),
              _SettingsRow(title: 'Export Schedule as PDF', icon: '↓'),
            ],
          ),
        ],
      ),
    );
  }
}

class ScheduleSetupScreen extends StatelessWidget {
  const ScheduleSetupScreen({super.key, this.next});
  final VoidCallback? next;

  @override
  Widget build(BuildContext context) {
    final c = Get.find<StudyDataController>();

    String formatStartTime() {
      final t = TimeOfDay(hour: c.defaultStartHour.value, minute: c.defaultStartMinute.value);
      return MaterialLocalizations.of(context).formatTimeOfDay(t, alwaysUse24HourFormat: MediaQuery.of(context).alwaysUse24HourFormat);
    }

    Future<void> pickStartTime() async {
      final initial = TimeOfDay(hour: c.defaultStartHour.value, minute: c.defaultStartMinute.value);
      final picked = await showTimePicker(context: context, initialTime: initial);
      if (picked != null) {
        c.defaultStartHour.value = picked.hour;
        c.defaultStartMinute.value = picked.minute;
      }
    }

    return _DetailScaffold(
      title: 'Schedule Setup',
      next: next,
      child: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Academic Year', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            StudyStyledDropdown<int>(
              value: c.scheduleYearIndex.value.clamp(0, c.academicYearOptions.length - 1),
              items: [
                for (var i = 0; i < c.academicYearOptions.length; i++)
                  DropdownMenuItem(value: i, child: Text(c.academicYearOptions[i])),
              ],
              onChanged: (v) {
                if (v != null) c.scheduleYearIndex.value = v;
              },
            ),
            const SizedBox(height: 14),
            const Text('Schedule type', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const Text('Classes rotate according to the schedule day.', style: TextStyle(color: Color(0xFF5D6670))),
            const SizedBox(height: 8),
            StudyChoiceChipGroup(
              labels: const ['Fixed', 'Week\nRotation', 'Day\nRotation'],
              selectedIndex: c.scheduleTypeIndex.value,
              onChanged: (i) => c.scheduleTypeIndex.value = i,
            ),
            const SizedBox(height: 14),
            const Text('First Day', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const Text('What is the first day of your school week?', style: TextStyle(color: Color(0xFF5D6670))),
            const SizedBox(height: 8),
            StudyStyledDropdown<int>(
              value: c.scheduleFirstWeekdayIndex.value.clamp(0, c.weekdayOptions.length - 1),
              items: [
                for (var i = 0; i < c.weekdayOptions.length; i++)
                  DropdownMenuItem(value: i, child: Text(c.weekdayOptions[i])),
              ],
              onChanged: (v) {
                if (v != null) c.scheduleFirstWeekdayIndex.value = v;
              },
            ),
            const SizedBox(height: 14),
            const Text('Default Start Time', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const Text('What time does your school day start?', style: TextStyle(color: Color(0xFF5D6670))),
            const SizedBox(height: 8),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: pickStartTime,
                child: Container(
                  width: double.infinity,
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
                  child: Text(formatStartTime(), style: const TextStyle(fontWeight: FontWeight.w600)),
                ),
              ),
            ),
            const SizedBox(height: 14),
            const Text('Duration*', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const Text('How long are your classes?', style: TextStyle(color: Color(0xFF5D6670))),
            const SizedBox(height: 8),
            StudyStyledDropdown<int>(
              value: c.scheduleDurationIndex.value.clamp(0, c.classDurationOptions.length - 1),
              items: [
                for (var i = 0; i < c.classDurationOptions.length; i++)
                  DropdownMenuItem(value: i, child: Text(c.classDurationOptions[i])),
              ],
              onChanged: (v) {
                if (v != null) c.scheduleDurationIndex.value = v;
              },
            ),
            const SizedBox(height: 12),
            AppSwitchTile(
              title: 'Bump rotation on holidays',
              value: c.scheduleBumpHolidays.value,
              onChanged: (v) => c.scheduleBumpHolidays.value = v,
            ),
          ],
        );
      }),
    );
  }
}

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({super.key, this.next});
  final VoidCallback? next;

  @override
  Widget build(BuildContext context) {
    final c = Get.find<StudyDataController>();
    return _DetailScaffold(
      title: 'Reminders',
      next: next,
      child: Obx(() {
        return Column(
          children: [
            AppSwitchTile(
              title: 'Reminders',
              value: c.remindersEnabled.value,
              onChanged: (v) => c.remindersEnabled.value = v,
            ),
            const SizedBox(height: 10),
            AppSwitchTile(
              title: 'Sound',
              value: c.reminderSoundEnabled.value,
              onChanged: (v) => c.reminderSoundEnabled.value = v,
            ),
            const SizedBox(height: 10),
            AppSwitchTile(
              title: 'Vibrate',
              value: c.reminderVibrateEnabled.value,
              onChanged: (v) => c.reminderVibrateEnabled.value = v,
            ),
            const SizedBox(height: 10),
            ReminderGroupCard(
              title: 'Class Reminders',
              enabled: c.classReminderEnabled.value,
              onEnabledChanged: (v) => c.classReminderEnabled.value = v,
              leadOptions: c.reminderLeadOptions,
              selectedLeadIndex: c.classReminderLeadIndex.value,
              onLeadChanged: (i) => c.classReminderLeadIndex.value = i,
            ),
            const SizedBox(height: 10),
            ReminderGroupCard(
              title: 'Exams Reminders',
              enabled: c.examReminderEnabled.value,
              onEnabledChanged: (v) => c.examReminderEnabled.value = v,
              leadOptions: c.reminderLeadOptions,
              selectedLeadIndex: c.examReminderLeadIndex.value,
              onLeadChanged: (i) => c.examReminderLeadIndex.value = i,
            ),
          ],
        );
      }),
    );
  }
}

class ManageSubjectsScreen extends StatelessWidget {
  const ManageSubjectsScreen({super.key, this.next});
  final VoidCallback? next;

  @override
  Widget build(BuildContext context) {
    final rows = Get.find<StudyRepository>().manageSubjects;
    return _DetailScaffold(
      title: 'Manage Subjects',
      next: next,
      child: Stack(
        children: [
          Column(
            children: [
              ...rows.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: StudyManageSubjectCard(item: item),
                ),
              ),
              const SizedBox(height: 70),
            ],
          ),
          Positioned(
            bottom: 10,
            right: 0,
            child: GestureDetector(
              onTap: () => Get.to(() => const NewSubjectScreen(), transition: Transition.cupertino),
              child: Container(
                width: 62,
                height: 62,
                decoration: BoxDecoration(
                  color: const Color(0xFF24C55E),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.green.withValues(alpha: 0.25), blurRadius: 12)],
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewSubjectScreen extends StatefulWidget {
  const NewSubjectScreen({super.key});

  @override
  State<NewSubjectScreen> createState() => _NewSubjectScreenState();
}

class _NewSubjectScreenState extends State<NewSubjectScreen> {
  static const _palette = [
    Color(0xFFE62424),
    Color(0xFFFF7913),
    Color(0xFFF5A80B),
    Color(0xFFF4CB1A),
    Color(0xFF1E6B3C),
    Color(0xFF2AC45D),
    Color(0xFF4BD37D),
    Color(0xFF78DFA0),
  ];

  final _name = TextEditingController();
  var _pickedColorIndex = 0;
  var _photoIndex = 2;

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  void _save() {
    FocusScope.of(context).unfocus();
    final name = _name.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Enter a subject name')));
      return;
    }
    Get.back();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Saved “$name” (demo only)')));
  }

  @override
  Widget build(BuildContext context) {
    return _DetailScaffold(
      title: 'New Subject',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 14),
          const Text('Subject name*', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17)),
          const SizedBox(height: 8),
          StudyStyledTextField(controller: _name, hintText: 'e.g. Statistics'),
          const SizedBox(height: 16),
          const Text('Color', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(_palette.length, (i) {
              final c = _palette[i];
              final selected = i == _pickedColorIndex;
              return GestureDetector(
                onTap: () => setState(() => _pickedColorIndex = i),
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: c,
                    border: Border.all(color: selected ? const Color(0xFF24C55E) : Colors.transparent, width: 3),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 14),
          const Text('Photo', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17)),
          const SizedBox(height: 10),
          Row(
            children: List.generate(4, (i) {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: i == 0 ? 0 : 8),
                  child: _PhotoTile(
                    selected: i == _photoIndex,
                    onTap: () => setState(() => _photoIndex = i),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(color: const Color(0xFFE5F7EA), borderRadius: BorderRadius.circular(10)),
            child: const Text('+ Upload photo 🗑️', style: TextStyle(color: Color(0xFF2F9D64), fontWeight: FontWeight.w700)),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _save,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF24C55E),
                minimumSize: const Size(double.infinity, 58),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text('Save Subject', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18)),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: Get.back,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF24C55E)),
                minimumSize: const Size(double.infinity, 58),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text('Cancel', style: TextStyle(color: Color(0xFF24C55E), fontWeight: FontWeight.w700, fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }
}

class HelpIntroScreen extends StatelessWidget {
  const HelpIntroScreen({super.key, this.next});
  final VoidCallback? next;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HelpBase(
        showCards: false,
        onClose: Get.back,
        onHomeTap: next ?? () {},
      ),
    );
  }
}

class HelpExpandedScreen extends StatelessWidget {
  const HelpExpandedScreen({super.key, this.next});
  final VoidCallback? next;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HelpBase(
        showCards: true,
        onClose: next ?? Get.back,
        onHomeTap: () {},
      ),
    );
  }
}

class PremiumOfferScreen extends StatelessWidget {
  const PremiumOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _DetailScaffold(
      title: '',
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 10, bottom: 26),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [const Color(0xFFA8EFC4), const Color(0xFF28C85F)]),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text('🎓', textAlign: TextAlign.center, style: TextStyle(fontSize: 72)),
          ),
          const SizedBox(height: 14),
          const Text(
            'Unlock Success Road+ Free for 1 Week - Plan Smarter, Stress Less',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
          ),
          const SizedBox(height: 10),
          const _PremiumBullet('Xtra - a comprehensive life planner'),
          const _PremiumBullet('Grade tracking'),
          const _PremiumBullet('AI Timetable Wizard Calendar Import'),
          const _PremiumBullet('Personalization'),
          const _PremiumBullet('Widgets'),
          const _PremiumBullet('Dark mode'),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF67CF8F)),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.check_circle, color: Color(0xFF24C55E)),
                    SizedBox(width: 8),
                    Expanded(child: Text('Success Road+ (1 year)', style: TextStyle(fontWeight: FontWeight.w700))),
                    _OfferBadge(),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'First 1 week free, then Rs 2,900.00/year (Rs 242/month). You can cancel anytime during the trial to avoid charges.',
                  style: TextStyle(color: Color(0xFF525A65)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF24C55E),
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text('Start your 1-week free trial', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18)),
            ),
          ),
          const SizedBox(height: 8),
          const Text('Restore purchases  •  Terms  •  Privacy policy', style: TextStyle(color: Color(0xFF6A727B))),
        ],
      ),
    );
  }
}

class _DetailScaffold extends StatelessWidget {
  const _DetailScaffold({
    required this.title,
    required this.child,
    this.next,
    this.backgroundColor = const Color(0xFFF4F5F7),
  });
  final String title;
  final Widget child;
  final VoidCallback? next;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final horizontal = width < 360 ? 10.0 : 14.0;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Padding(
              padding: EdgeInsets.fromLTRB(horizontal, 12, horizontal, 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(Icons.chevron_left),
                          onPressed: Get.back,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
                        ),
                      ),
                      if (next != null)
                        TextButton(
                          onPressed: next,
                          child: const Text('Next', style: TextStyle(color: Color(0xFF24C55E), fontWeight: FontWeight.w700)),
                        )
                      else
                        const SizedBox(width: 44),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(child: SingleChildScrollView(child: child)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  const _SettingsSection({required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(children: children),
    );
  }
}

class _SettingsRow extends StatelessWidget {
  const _SettingsRow({required this.title, required this.icon, this.onTap});
  final String title;
  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFF1F1F1)))),
        child: Row(
          children: [
            Text(icon),
            const SizedBox(width: 12),
            Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17))),
            const Icon(Icons.chevron_right, color: Color(0xFF24C55E)),
          ],
        ),
      ),
    );
  }
}

class _DarkModeToggleRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c = Get.find<StudyDataController>();
    return Obx(() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: const BoxDecoration(border: Border(top: BorderSide(color: Color(0xFFF1F1F1)))),
        child: Row(
          children: [
            const Text('🌙'),
            const SizedBox(width: 12),
            const Expanded(child: Text('Dark mode', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17))),
            Switch.adaptive(
              value: c.darkModeEnabled.value,
              onChanged: (v) => c.darkModeEnabled.value = v,
            ),
          ],
        ),
      );
    });
  }
}

class _PhotoTile extends StatelessWidget {
  const _PhotoTile({this.selected = false, this.onTap});
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          height: 78,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: selected ? const LinearGradient(colors: [Color(0xFF77EFA7), Color(0xFF2ACA63)]) : null,
            color: selected ? null : const Color(0xFFD4F0DE),
          ),
          child: const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: CircleAvatar(
                radius: 13,
                backgroundColor: Color(0xFF1F3550),
                child: Icon(Icons.lock, color: Color(0xFFF4C95A), size: 14),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HelpBase extends StatelessWidget {
  const _HelpBase({
    required this.showCards,
    required this.onClose,
    required this.onHomeTap,
  });

  final bool showCards;
  final VoidCallback onClose;
  final VoidCallback onHomeTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color(0xFF0E7632), const Color(0xFF3BDE71)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
              child: Row(
                children: [
                  const Text('◀  Success Road', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20)),
                  const Spacer(),
                  IconButton(onPressed: onClose, icon: const Icon(Icons.close, color: Colors.white)),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 14),
                    const Text('Hi Zain 👋', style: TextStyle(color: Color(0xFFD1D5DB), fontSize: 20, fontWeight: FontWeight.w700)),
                    const Text('How can we help you today?', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
                    if (showCards) ...[
                      const SizedBox(height: 14),
                      const _HelpActionCard(title: 'Ask a question', subtitle: 'We are here to help.', icon: '💬'),
                      const SizedBox(height: 8),
                      const _HelpActionCard(title: 'Report an issue', subtitle: 'Found a bug? Let us know.', icon: '🐞'),
                      const SizedBox(height: 8),
                      const _HelpActionCard(title: 'Request a feature', subtitle: 'What would you like to see next?', icon: '💡'),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          children: [
                            const StudyStyledTextField(hintText: 'Search for help'),
                            const SizedBox(height: 8),
                            const _HelpArticle('Why We\'re Introducing Ads on Success Road'),
                            const _HelpArticle('How to Talk to Your Parents about MSL'),
                            const _HelpArticle('How to Add Success Road Widgets...'),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(14, 8, 14, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: onHomeTap,
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.home_outlined, color: Color(0xFF24C55E)),
                        Text('Home', style: TextStyle(color: Color(0xFF24C55E), fontSize: 12)),
                      ],
                    ),
                  ),
                  const _HelpNavItem(icon: Icons.chat_bubble_outline, label: 'Messages'),
                  const _HelpNavItem(icon: Icons.newspaper_outlined, label: 'News'),
                  const _HelpNavItem(icon: Icons.map_outlined, label: 'Roadmap'),
                  const _HelpNavItem(icon: Icons.help_outline, label: 'Help'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HelpActionCard extends StatelessWidget {
  const _HelpActionCard({required this.title, required this.subtitle, required this.icon});
  final String title;
  final String subtitle;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
                Text(subtitle, style: const TextStyle(color: Color(0xFF5D6670))),
              ],
            ),
          ),
          Text(icon, style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}

class _HelpArticle extends StatelessWidget {
  const _HelpArticle(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w700))),
          const Icon(Icons.chevron_right, color: Color(0xFF2F9D64)),
        ],
      ),
    );
  }
}

class _HelpNavItem extends StatelessWidget {
  const _HelpNavItem({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: const Color(0xFF9CA3AF)),
        Text(label, style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
      ],
    );
  }
}

class _PremiumBullet extends StatelessWidget {
  const _PremiumBullet(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          const Icon(Icons.check, color: Color(0xFF24C55E)),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class _OfferBadge extends StatelessWidget {
  const _OfferBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(color: const Color(0xFF24C55E), borderRadius: BorderRadius.circular(999)),
      child: const Text('65% OFF', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12)),
    );
  }
}

class _OverlayTodayButton extends StatelessWidget {
  const _OverlayTodayButton({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Container(
            width: 84,
            height: 42,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFF24C55E)),
            ),
            child: const Text('Today', style: TextStyle(color: Color(0xFF24C55E), fontWeight: FontWeight.w700, fontSize: 18)),
          ),
        ),
      ),
    );
  }
}

class _SelectableModeRow extends StatelessWidget {
  const _SelectableModeRow({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              Icon(Icons.calendar_month_outlined, color: selected ? const Color(0xFF24C55E) : Colors.black54),
              const SizedBox(width: 10),
              Expanded(child: Text(label, style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: selected ? const Color(0xFF15763B) : const Color(0xFF374151)))),
            ],
          ),
        ),
      ),
    );
  }
}

class _SelectableFilterRow extends StatelessWidget {
  const _SelectableFilterRow({required this.color, required this.title, required this.selected, required this.onTap});

  final Color color;
  final String title;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(color: const Color(0xFFCDEBD9), borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Container(width: 28, height: 28, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8))),
              const SizedBox(width: 10),
              Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16))),
              CircleAvatar(
                radius: 12,
                backgroundColor: selected ? const Color(0xFF24C55E) : const Color(0xFFE5E7EB),
                child: Icon(selected ? Icons.check : Icons.close, size: 14, color: selected ? Colors.white : const Color(0xFF9CA3AF)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
