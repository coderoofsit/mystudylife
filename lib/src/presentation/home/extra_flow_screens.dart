import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalendarFilterOverlayScreen extends StatelessWidget {
  const CalendarFilterOverlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6),
                    _TodayButton(onTap: Get.back),
                    const SizedBox(height: 14),
                    const _ModeRow(label: 'Day'),
                    const _ModeRow(label: 'Week'),
                    const _ModeRow(label: 'Month'),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 8),
                    const _FilterRow(color: Color(0xFF24C55E), title: 'Classes'),
                    const _FilterRow(color: Color(0xFF9C4CF2), title: 'Exams'),
                    const _FilterRow(color: Color(0xFF1DB5D0), title: 'Tasks'),
                    const _FilterRow(color: Color(0xFFF6AB0C), title: 'Holidays'),
                    const _FilterRow(color: Color(0xFFF4D219), title: 'Xtra'),
                    const _FilterRow(color: Color(0xFFF6973C), title: 'ICal'),
                  ],
                ),
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
    return _DetailScaffold(
      title: 'Tasks',
      next: next,
      child: Column(
        children: const [
          _SegmentControl(labels: ['Current', 'Past', 'Overdue']),
          SizedBox(height: 12),
          _DropdownLikeField(text: 'All Subjects'),
          SizedBox(height: 12),
          _InfoCard(title: 'Math Assignment Ch.5', subtitle: 'Mathematics', right: 'May 8', chip: 'Due Tomorrow', color: Color(0xFF24C55E)),
          SizedBox(height: 10),
          _InfoCard(title: 'Physics Lab Report', subtitle: 'Physics · Mechanics', right: 'May 7', chip: 'Due Today', chipTint: Color(0xFFFDE7EB), chipText: Color(0xFFC5415D), color: Color(0xFF9B57E7)),
          SizedBox(height: 10),
          _InfoCard(title: 'English Essay Draft', subtitle: 'English Literature', right: 'May 10', chip: 'Due May 10', color: Color(0xFFF6AB0C)),
          SizedBox(height: 10),
          _InfoCard(title: 'Chemistry Notes', subtitle: 'Chemistry · Organic', right: 'May 12', chip: 'Due May 12', color: Color(0xFF23BED9)),
          SizedBox(height: 10),
          _InfoCard(title: 'CS Coding Project', subtitle: 'Computer Science', right: 'May 15', chip: 'Due May 15', color: Color(0xFFE953AF)),
        ],
      ),
    );
  }
}

class ClassesScreen extends StatelessWidget {
  const ClassesScreen({super.key, this.next});
  final VoidCallback? next;

  @override
  Widget build(BuildContext context) {
    return _DetailScaffold(
      title: 'Classes',
      next: next,
      child: Column(
        children: const [
          _SegmentControl(labels: ['Current', 'Past']),
          SizedBox(height: 12),
          _DropdownLikeField(text: 'All Subjects'),
          SizedBox(height: 12),
          _InfoCard(title: 'Mathematics', subtitle: 'Mr. Khan · Room 204', right: '9:00 AM', chip: 'Mon · Wed · Fri', color: Color(0xFF24C55E)),
          SizedBox(height: 10),
          _InfoCard(title: 'Physics', subtitle: 'Ms. Ahmed · Lab 3', right: '11:30 AM', chip: 'Tue · Thu', color: Color(0xFF9B57E7)),
          SizedBox(height: 10),
          _InfoCard(title: 'English Literature', subtitle: 'Mrs. Riaz · Room 112', right: '2:00 PM', chip: 'Mon · Thu', color: Color(0xFFF6AB0C)),
          SizedBox(height: 10),
          _InfoCard(title: 'Chemistry', subtitle: 'Dr. Saleem · Lab 1', right: '10:00 AM', chip: 'Wed · Fri', color: Color(0xFF23BED9)),
          SizedBox(height: 10),
          _InfoCard(title: 'Computer Science', subtitle: 'Mr. Bilal · Room 305', right: '1:00 PM', chip: 'Tue · Fri', color: Color(0xFFE953AF)),
        ],
      ),
    );
  }
}

class ExamsScreen extends StatelessWidget {
  const ExamsScreen({super.key, this.next});
  final VoidCallback? next;

  @override
  Widget build(BuildContext context) {
    return _DetailScaffold(
      title: 'Exams',
      next: next,
      child: Column(
        children: const [
          _SegmentControl(labels: ['Current', 'Past']),
          SizedBox(height: 12),
          _DropdownLikeField(text: 'All Subjects'),
          SizedBox(height: 12),
          _InfoCard(title: 'Math Mid-term', subtitle: 'Mathematics · Hall A', right: 'May 15', chip: 'In 8 days', color: Color(0xFF24C55E)),
          SizedBox(height: 10),
          _InfoCard(title: 'Physics Final', subtitle: 'Physics · Hall B', right: 'May 20', chip: 'In 13 days', color: Color(0xFF9B57E7)),
          SizedBox(height: 10),
          _InfoCard(title: 'Chemistry Quiz', subtitle: 'Chemistry · Lab 1', right: 'May 12', chip: 'In 5 days', color: Color(0xFF23BED9)),
          SizedBox(height: 10),
          _InfoCard(title: 'English Essay Test', subtitle: 'English Lit · Room 112', right: 'May 25', chip: 'In 18 days', color: Color(0xFFF6AB0C)),
          SizedBox(height: 10),
          _InfoCard(title: 'CS Practical', subtitle: 'Computer Science · Lab 3', right: 'May 29', chip: 'In 22 days', color: Color(0xFFE953AF)),
        ],
      ),
    );
  }
}

class VacationsScreen extends StatelessWidget {
  const VacationsScreen({super.key, this.next});
  final VoidCallback? next;

  @override
  Widget build(BuildContext context) {
    return _DetailScaffold(
      title: 'Vacations',
      next: next,
      child: Column(
        children: const [
          _SegmentControl(labels: ['Upcoming', 'Past']),
          SizedBox(height: 12),
          _InfoCard(title: 'Eid ul Fitr Holiday', subtitle: 'Religious Holiday · 3 days', right: '3 days', chip: 'Mar 31 - Apr 2', color: Color(0xFFF6AB0C)),
          SizedBox(height: 10),
          _InfoCard(title: 'Spring Break', subtitle: 'School Holiday · 1 week', right: '7 days', chip: 'Apr 14 - Apr 20', color: Color(0xFFF6AB0C)),
          SizedBox(height: 10),
          _InfoCard(title: 'Summer Vacation', subtitle: 'School Holiday · 11 weeks', right: '76 days', chip: 'Jun 15 - Aug 30', color: Color(0xFFF6AB0C)),
          SizedBox(height: 10),
          _InfoCard(title: 'Independence Day', subtitle: 'National Holiday', right: '1 day', chip: 'Aug 14', color: Color(0xFFF6AB0C)),
          SizedBox(height: 10),
          _InfoCard(title: 'Winter Break', subtitle: 'School Holiday · 2 weeks', right: '15 days', chip: 'Dec 22 - Jan 5', color: Color(0xFFF6AB0C)),
        ],
      ),
    );
  }
}

class PersonalizeScreen extends StatelessWidget {
  const PersonalizeScreen({super.key, this.next});
  final VoidCallback? next;

  @override
  Widget build(BuildContext context) {
    return _DetailScaffold(
      title: 'Personalize',
      next: next,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Which country are you from? 👑', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          SizedBox(height: 6),
          Text(
            'If you want to, let us know where you are from so we can suggest the most relevant personalization.',
            style: TextStyle(fontSize: 14, color: Color(0xFF5D6670)),
          ),
          SizedBox(height: 10),
          _DropdownLikeField(text: 'Pakistan'),
          SizedBox(height: 16),
          Text('Date format you prefer', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          SizedBox(height: 10),
          _ChoiceWrap(labels: ['Jan 1, 2022', '1 Jan, 2022', '2022, Jan 1'], selected: 0),
          SizedBox(height: 14),
          Text('Time format you prefer', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          SizedBox(height: 10),
          _ChoiceWrap(labels: ['12 hrs (Eg. 3pm)', '24 hrs (Eg. 15:00)'], selected: 0),
          SizedBox(height: 14),
          Text('Days to display on the dashboard', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          SizedBox(height: 10),
          _ChoiceWrap(labels: ['1', '2', '3', '4', '5'], selected: 1, outlined: true),
          SizedBox(height: 14),
          Text('Task completion confetti', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          SizedBox(height: 10),
          _ChoiceWrap(labels: ['On', 'Off'], selected: 0),
          SizedBox(height: 14),
          Text('Show completed tasks on the dashboard', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          SizedBox(height: 10),
          _ChoiceWrap(labels: ['Show', 'Hide 🗑️'], selected: 0),
        ],
      ),
    );
  }
}

class XtraScreen extends StatelessWidget {
  const XtraScreen({super.key, this.next});
  final VoidCallback? next;

  @override
  Widget build(BuildContext context) {
    return _DetailScaffold(
      title: 'Xtra',
      next: next,
      child: Column(
        children: const [
          _SegmentControl(labels: ['Academic', 'Non-Academic']),
          SizedBox(height: 14),
          _XtraCard(icon: '📚', title: 'Group Study Session', subtitle: 'Mathematics · Library', time: '2 hrs', chip: 'Today, 4 PM'),
          SizedBox(height: 10),
          _XtraCard(icon: '📝', title: 'Project Meeting', subtitle: 'Computer Science · Lab 3', time: '1 hr', chip: 'Tomorrow, 2 PM'),
          SizedBox(height: 10),
          _XtraCard(icon: '🔬', title: 'Lab Session', subtitle: 'Chemistry · Lab 1', time: '3 hrs', chip: 'May 9, 11 AM'),
          SizedBox(height: 10),
          _XtraCard(icon: '🎓', title: 'Tutoring', subtitle: 'Physics · Office Hours', time: '1 hr', chip: 'May 10, 3 PM'),
          SizedBox(height: 10),
          _XtraCard(icon: '📖', title: 'Reading Club', subtitle: 'English · Room 112', time: '90 min', chip: 'May 11, 5 PM'),
        ],
      ),
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
            'Easily connect MyStudyLife to your school, university,\nor personal calendar to keep your MSL schedule up to date automatically.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF4B5563), height: 1.4),
          ),
          const SizedBox(height: 10),
          const Text(
            'Simply download your iCal link and upload it here. Any changes to your calendar will sync instantly with MyStudyLife.',
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

class CalendarSyncScreen extends StatelessWidget {
  const CalendarSyncScreen({super.key, this.next});
  final VoidCallback? next;

  @override
  Widget build(BuildContext context) {
    return _DetailScaffold(
      title: 'Calendar Sync',
      next: next,
      backgroundColor: const Color(0xFFDDF5E4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('1. Get your iCal link', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          SizedBox(height: 6),
          Text('Copy the iCal URL from your calendar provider and paste it into MyStudyLife to sync your schedule.', style: TextStyle(color: Color(0xFF4B5563))),
          SizedBox(height: 10),
          _DropdownLikeField(text: 'Google Calendar'),
          SizedBox(height: 8),
          Text.rich(
            TextSpan(
              text: "Can't find your calendar type? ",
              style: TextStyle(fontWeight: FontWeight.w700),
              children: [TextSpan(text: 'Check this guide', style: TextStyle(color: Color(0xFF239D60), decoration: TextDecoration.underline))],
            ),
          ),
          SizedBox(height: 16),
          Text('2. Paste the link here', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          SizedBox(height: 10),
          Text('Title*', style: TextStyle(fontWeight: FontWeight.w700)),
          SizedBox(height: 6),
          _InputLikeField(text: 'School Timetable'),
          SizedBox(height: 12),
          Text('URL*', style: TextStyle(fontWeight: FontWeight.w700)),
          SizedBox(height: 6),
          _InputLikeField(text: 'https://calendar.google.com/calendar/ical/...', height: 82),
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
              _SettingsToggleRow(title: 'Dark mode', icon: '🌙'),
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
    return _DetailScaffold(
      title: 'Schedule Setup',
      next: next,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Academic Year', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          SizedBox(height: 8),
          _DropdownLikeField(text: 'Manage Academic Years'),
          SizedBox(height: 14),
          Text('Schedule type', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          Text('Classes rotate according to the schedule day.', style: TextStyle(color: Color(0xFF5D6670))),
          SizedBox(height: 8),
          _ChoiceWrap(labels: ['Fixed', 'Week\nRotation', 'Day\nRotation'], selected: 0),
          SizedBox(height: 14),
          Text('First Day', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          Text('What is the first day of your school week?', style: TextStyle(color: Color(0xFF5D6670))),
          SizedBox(height: 8),
          _DropdownLikeField(text: 'Monday'),
          SizedBox(height: 14),
          Text('Default Start Time', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          Text('What time does your school day start?', style: TextStyle(color: Color(0xFF5D6670))),
          SizedBox(height: 8),
          _InputLikeField(text: '9:00 AM'),
          SizedBox(height: 14),
          Text('Duration*', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          Text('How long are your classes?', style: TextStyle(color: Color(0xFF5D6670))),
          SizedBox(height: 8),
          _DropdownLikeField(text: '60 minutes'),
          SizedBox(height: 12),
          _TogglePanel(title: 'Bump rotation on holidays'),
        ],
      ),
    );
  }
}

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({super.key, this.next});
  final VoidCallback? next;

  @override
  Widget build(BuildContext context) {
    return _DetailScaffold(
      title: 'Reminders',
      next: next,
      child: const Column(
        children: [
          _TogglePanel(title: 'Reminders'),
          SizedBox(height: 10),
          _TogglePanel(title: 'Sound'),
          SizedBox(height: 10),
          _TogglePanel(title: 'Vibrate'),
          SizedBox(height: 10),
          _ReminderGroup(title: 'Class Reminders'),
          SizedBox(height: 10),
          _ReminderGroup(title: 'Exams Reminders'),
        ],
      ),
    );
  }
}

class ManageSubjectsScreen extends StatelessWidget {
  const ManageSubjectsScreen({super.key, this.next});
  final VoidCallback? next;

  @override
  Widget build(BuildContext context) {
    return _DetailScaffold(
      title: 'Manage Subjects',
      next: next,
      child: Stack(
        children: [
          const Column(
            children: [
              _SubjectCard(title: 'ENGLISH', color: Color(0xFF4FD26D)),
              SizedBox(height: 10),
              _SubjectCard(title: 'MATHEMATICS', color: Color(0xFF1D7B43)),
              SizedBox(height: 10),
              _SubjectCard(title: 'SCIENCE', color: Color(0xFF4FD26D)),
              SizedBox(height: 10),
              _SubjectCard(title: 'BIOLOGY', color: Color(0xFF1D7B43)),
              SizedBox(height: 10),
              _SubjectCard(title: 'CHEMISTRY', color: Color(0xFFF18622)),
              SizedBox(height: 10),
              _SubjectCard(title: 'PHYSICS', color: Color(0xFF9B57E7)),
              SizedBox(height: 70),
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

class NewSubjectScreen extends StatelessWidget {
  const NewSubjectScreen({super.key});

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
          const _InputLikeField(text: ''),
          const SizedBox(height: 16),
          const Text('Color', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _ColorDot(Color(0xFFE62424)),
              _ColorDot(Color(0xFFFF7913)),
              _ColorDot(Color(0xFFF5A80B)),
              _ColorDot(Color(0xFFF4CB1A)),
              _ColorDot(Color(0xFF1E6B3C)),
              _ColorDot(Color(0xFF2AC45D)),
              _ColorDot(Color(0xFF4BD37D)),
              _ColorDot(Color(0xFF78DFA0)),
            ],
          ),
          const SizedBox(height: 14),
          const Text('Photo', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17)),
          const SizedBox(height: 10),
          const Row(
            children: [
              Expanded(child: _PhotoTile()),
              SizedBox(width: 8),
              Expanded(child: _PhotoTile()),
              SizedBox(width: 8),
              Expanded(child: _PhotoTile(selected: true)),
              SizedBox(width: 8),
              Expanded(child: _PhotoTile()),
            ],
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
              onPressed: Get.back,
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
            'Unlock MyStudyLife+ Free for 1 Week - Plan Smarter, Stress Less',
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
                    Expanded(child: Text('MyStudyLife+ (1 year)', style: TextStyle(fontWeight: FontWeight.w700))),
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

class _SegmentControl extends StatelessWidget {
  const _SegmentControl({required this.labels});
  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(color: const Color(0xFFCBEBD8), borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: List.generate(labels.length, (i) {
          final selected = i == 0;
          return Expanded(
            child: Container(
              height: 42,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected ? const Color(0xFF24C55E) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                labels[i],
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: selected ? Colors.white : const Color(0xFF2B5138),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _DropdownLikeField extends StatelessWidget {
  const _DropdownLikeField({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: [
          Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
          const Spacer(),
          const Icon(Icons.arrow_drop_down, size: 18),
        ],
      ),
    );
  }
}

class _InputLikeField extends StatelessWidget {
  const _InputLikeField({required this.text, this.height = 48});
  final String text;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
      child: Text(text, style: const TextStyle(color: Color(0xFF8B929C))),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.title,
    required this.subtitle,
    required this.right,
    required this.chip,
    required this.color,
    this.chipTint = const Color(0xFFE5F7EA),
    this.chipText = const Color(0xFF236847),
  });

  final String title;
  final String subtitle;
  final String right;
  final String chip;
  final Color color;
  final Color chipTint;
  final Color chipText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(width: 5, height: 52, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(99))),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17))),
                    Text(right, style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF4E5561))),
                  ],
                ),
                Text(subtitle, style: const TextStyle(fontSize: 13, color: Color(0xFF5E6670))),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(color: chipTint, borderRadius: BorderRadius.circular(6)),
                  child: Text(chip, style: TextStyle(fontWeight: FontWeight.w700, color: chipText, fontSize: 12)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChoiceWrap extends StatelessWidget {
  const _ChoiceWrap({required this.labels, this.selected = 0, this.outlined = false});
  final List<String> labels;
  final int selected;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(labels.length, (i) {
        final isSelected = i == selected;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF24C55E) : const Color(0xFFCFF0DC),
            borderRadius: BorderRadius.circular(14),
            border: outlined && isSelected ? Border.all(color: const Color(0xFF24C55E)) : null,
          ),
          child: Text(
            labels[i],
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: isSelected ? Colors.white : const Color(0xFF2A975F),
            ),
          ),
        );
      }),
    );
  }
}

class _XtraCard extends StatelessWidget {
  const _XtraCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.chip,
  });

  final String icon;
  final String title;
  final String subtitle;
  final String time;
  final String chip;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: const Color(0xFFE1F7E9), borderRadius: BorderRadius.circular(12)),
            child: Text(icon, style: const TextStyle(fontSize: 24)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                Text(subtitle, style: const TextStyle(color: Color(0xFF5E6670))),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(color: const Color(0xFFE5F7EA), borderRadius: BorderRadius.circular(6)),
                  child: Text(chip, style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF236847), fontSize: 12)),
                ),
              ],
            ),
          ),
          Text(time, style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF4E5561))),
        ],
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

class _SettingsToggleRow extends StatelessWidget {
  const _SettingsToggleRow({required this.title, required this.icon});
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: Row(
        children: [
          Text(icon),
          const SizedBox(width: 12),
          Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17))),
          Switch(value: false, onChanged: (_) {}),
        ],
      ),
    );
  }
}

class _TogglePanel extends StatelessWidget {
  const _TogglePanel({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17))),
          Switch(value: true, onChanged: (_) {}),
        ],
      ),
    );
  }
}

class _ReminderGroup extends StatelessWidget {
  const _ReminderGroup({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17))),
              Switch(value: true, onChanged: (_) {}),
            ],
          ),
          const Text('How many minutes before your class would you like to receive a reminder.', style: TextStyle(color: Color(0xFF5E6670))),
          const SizedBox(height: 8),
          const Text('Remind Me Before', style: TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          const _DropdownLikeField(text: '5 Minutes'),
        ],
      ),
    );
  }
}

class _SubjectCard extends StatelessWidget {
  const _SubjectCard({required this.title, required this.color});
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(width: 5, height: 60, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(99))),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, letterSpacing: 0.8)),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(color: const Color(0xFFE5F7EA), borderRadius: BorderRadius.circular(8)),
                  child: const Text('Edit', style: TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF24A660))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ColorDot extends StatelessWidget {
  const _ColorDot(this.color);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(width: 38, height: 38, decoration: BoxDecoration(shape: BoxShape.circle, color: color));
  }
}

class _PhotoTile extends StatelessWidget {
  const _PhotoTile({this.selected = false});
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: selected ? LinearGradient(colors: [const Color(0xFF77EFA7), const Color(0xFF2ACA63)]) : null,
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
                  const Text('◀  MyStudyLife', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20)),
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
                        child: const Column(
                          children: [
                            _InputLikeField(text: 'Search for help'),
                            SizedBox(height: 8),
                            _HelpArticle('Why We\'re Introducing Ads on MyStudyLife'),
                            _HelpArticle('How to Talk to Your Parents about MSL'),
                            _HelpArticle('How to Add MyStudyLife Widgets...'),
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

class _TodayButton extends StatelessWidget {
  const _TodayButton({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
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
    );
  }
}

class _ModeRow extends StatelessWidget {
  const _ModeRow({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const Icon(Icons.calendar_month_outlined),
          const SizedBox(width: 10),
          Text(label, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class _FilterRow extends StatelessWidget {
  const _FilterRow({required this.color, required this.title});
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(color: const Color(0xFFCDEBD9), borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(width: 28, height: 28, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8))),
          const SizedBox(width: 10),
          Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16))),
          const CircleAvatar(
            radius: 12,
            backgroundColor: Color(0xFF24C55E),
            child: Icon(Icons.check, size: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
