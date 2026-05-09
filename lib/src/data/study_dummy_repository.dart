import 'package:flutter/material.dart';

import '../domain/models/study_models.dart';
import 'study_repository.dart';

/// In-memory fixture data for development and UI integration tests.
class StudyDummyRepository implements StudyRepository {
  StudyDummyRepository() {
    _subjects = List<StudySubject>.unmodifiable(_seedSubjects);
    _tasks = List<StudyTaskItem>.from(_seedTasks);
    _classes = List<StudySessionItem>.from(_seedClasses);
    _exams = List<StudySessionItem>.from(_seedExams);
    _vacations = List<StudyVacationItem>.from(_seedVacations);
    _xtra = List<StudyXtraItem>.from(_seedXtra);
    _calendarEvents = List<StudyCalendarEvent>.from(_seedCalendarEvents);
  }

  late final List<StudySubject> _subjects;
  late final List<StudyTaskItem> _tasks;
  late final List<StudySessionItem> _classes;
  late final List<StudySessionItem> _exams;
  late final List<StudyVacationItem> _vacations;
  late final List<StudyXtraItem> _xtra;
  late final List<StudyCalendarEvent> _calendarEvents;

  static final _manageSubjects = <ManageSubjectRow>[
    const ManageSubjectRow(id: 'sub_en', title: 'ENGLISH', color: Color(0xFF4FD26D)),
    const ManageSubjectRow(id: 'sub_ma', title: 'MATHEMATICS', color: Color(0xFF1D7B43)),
    const ManageSubjectRow(id: 'sub_sc', title: 'SCIENCE', color: Color(0xFF4FD26D)),
    const ManageSubjectRow(id: 'sub_bi', title: 'BIOLOGY', color: Color(0xFF1D7B43)),
    const ManageSubjectRow(id: 'sub_ch', title: 'CHEMISTRY', color: Color(0xFFF18622)),
    const ManageSubjectRow(id: 'sub_ph', title: 'PHYSICS', color: Color(0xFF9B57E7)),
  ];

  static const _seedSubjects = <StudySubject>[
    StudySubject(id: 'all', name: 'All Subjects'),
    StudySubject(id: 'math', name: 'Mathematics'),
    StudySubject(id: 'physics', name: 'Physics'),
    StudySubject(id: 'english', name: 'English Literature'),
    StudySubject(id: 'chemistry', name: 'Chemistry'),
    StudySubject(id: 'cs', name: 'Computer Science'),
  ];

  static final _seedTasks = <StudyTaskItem>[
    StudyTaskItem(
      id: 't1',
      title: 'Math Assignment Ch.5',
      subtitle: 'Mathematics',
      right: 'May 8',
      chip: 'Due Tomorrow',
      accentColor: const Color(0xFF24C55E),
      bucket: TaskBucket.current,
      subjectId: 'math',
      dueAt: DateTime(2026, 5, 10, 23, 59),
    ),
    StudyTaskItem(
      id: 't2',
      title: 'Physics Lab Report',
      subtitle: 'Physics · Mechanics',
      right: 'May 7',
      chip: 'Due Today',
      accentColor: const Color(0xFF9B57E7),
      bucket: TaskBucket.current,
      subjectId: 'physics',
      chipTint: const Color(0xFFFDE7EB),
      chipText: const Color(0xFFC5415D),
      dueAt: DateTime(2026, 5, 9, 18, 0),
    ),
    StudyTaskItem(
      id: 't3',
      title: 'English Essay Draft',
      subtitle: 'English Literature',
      right: 'May 10',
      chip: 'Due May 10',
      accentColor: const Color(0xFFF6AB0C),
      bucket: TaskBucket.current,
      subjectId: 'english',
      dueAt: DateTime(2026, 5, 10, 9, 0),
    ),
    StudyTaskItem(
      id: 't4',
      title: 'Chemistry Notes',
      subtitle: 'Chemistry · Organic',
      right: 'May 12',
      chip: 'Due May 12',
      accentColor: const Color(0xFF23BED9),
      bucket: TaskBucket.current,
      subjectId: 'chemistry',
      dueAt: DateTime(2026, 5, 12),
    ),
    StudyTaskItem(
      id: 't5',
      title: 'CS Coding Project',
      subtitle: 'Computer Science',
      right: 'May 15',
      chip: 'Due May 15',
      accentColor: const Color(0xFFE953AF),
      bucket: TaskBucket.current,
      subjectId: 'cs',
      dueAt: DateTime(2026, 5, 15),
    ),
    StudyTaskItem(
      id: 't6',
      title: 'Past Homework',
      subtitle: 'Mathematics',
      right: 'Apr 2',
      chip: 'Submitted',
      accentColor: const Color(0xFF24C55E),
      bucket: TaskBucket.past,
      subjectId: 'math',
      completed: true,
      dueAt: DateTime(2026, 4, 2),
    ),
    StudyTaskItem(
      id: 't7',
      title: 'Overdue Quiz Prep',
      subtitle: 'Physics',
      right: 'May 5',
      chip: 'Overdue',
      accentColor: const Color(0xFFE64963),
      bucket: TaskBucket.overdue,
      subjectId: 'physics',
      chipTint: const Color(0xFFFDE7EB),
      chipText: const Color(0xFFC5415D),
      dueAt: DateTime(2026, 5, 5),
    ),
  ];

  static final _seedClasses = <StudySessionItem>[
    const StudySessionItem(
      id: 'c1',
      title: 'Mathematics',
      subtitle: 'Mr. Khan · Room 204',
      right: '9:00 AM',
      chip: 'Mon · Wed · Fri',
      accentColor: Color(0xFF24C55E),
      bucket: ClassExamBucket.current,
      subjectId: 'math',
    ),
    const StudySessionItem(
      id: 'c2',
      title: 'Physics',
      subtitle: 'Ms. Ahmed · Lab 3',
      right: '11:30 AM',
      chip: 'Tue · Thu',
      accentColor: Color(0xFF9B57E7),
      bucket: ClassExamBucket.current,
      subjectId: 'physics',
    ),
    const StudySessionItem(
      id: 'c3',
      title: 'English Literature',
      subtitle: 'Mrs. Riaz · Room 112',
      right: '2:00 PM',
      chip: 'Mon · Thu',
      accentColor: Color(0xFFF6AB0C),
      bucket: ClassExamBucket.current,
      subjectId: 'english',
    ),
    const StudySessionItem(
      id: 'c4',
      title: 'Chemistry',
      subtitle: 'Dr. Saleem · Lab 1',
      right: '10:00 AM',
      chip: 'Wed · Fri',
      accentColor: Color(0xFF23BED9),
      bucket: ClassExamBucket.current,
      subjectId: 'chemistry',
    ),
    const StudySessionItem(
      id: 'c5',
      title: 'Computer Science',
      subtitle: 'Mr. Bilal · Room 305',
      right: '1:00 PM',
      chip: 'Tue · Fri',
      accentColor: Color(0xFFE953AF),
      bucket: ClassExamBucket.current,
      subjectId: 'cs',
    ),
    StudySessionItem(
      id: 'c6',
      title: 'History (last term)',
      subtitle: 'Archived · Room 101',
      right: '10:00 AM',
      chip: 'Completed',
      accentColor: const Color(0xFF9CA3AF),
      bucket: ClassExamBucket.past,
      chipTint: const Color(0xFFF3F4F6),
      chipText: const Color(0xFF6B7280),
    ),
  ];

  static final _seedExams = <StudySessionItem>[
    const StudySessionItem(
      id: 'e1',
      title: 'Math Mid-term',
      subtitle: 'Mathematics · Hall A',
      right: 'May 15',
      chip: 'In 8 days',
      accentColor: Color(0xFF24C55E),
      bucket: ClassExamBucket.current,
      subjectId: 'math',
    ),
    const StudySessionItem(
      id: 'e2',
      title: 'Physics Final',
      subtitle: 'Physics · Hall B',
      right: 'May 20',
      chip: 'In 13 days',
      accentColor: Color(0xFF9B57E7),
      bucket: ClassExamBucket.current,
      subjectId: 'physics',
    ),
    const StudySessionItem(
      id: 'e3',
      title: 'Chemistry Quiz',
      subtitle: 'Chemistry · Lab 1',
      right: 'May 12',
      chip: 'In 5 days',
      accentColor: Color(0xFF23BED9),
      bucket: ClassExamBucket.current,
      subjectId: 'chemistry',
    ),
    const StudySessionItem(
      id: 'e4',
      title: 'English Essay Test',
      subtitle: 'English Lit · Room 112',
      right: 'May 25',
      chip: 'In 18 days',
      accentColor: Color(0xFFF6AB0C),
      bucket: ClassExamBucket.current,
      subjectId: 'english',
    ),
    const StudySessionItem(
      id: 'e5',
      title: 'CS Practical',
      subtitle: 'Computer Science · Lab 3',
      right: 'May 29',
      chip: 'In 22 days',
      accentColor: Color(0xFFE953AF),
      bucket: ClassExamBucket.current,
      subjectId: 'cs',
    ),
    StudySessionItem(
      id: 'e6',
      title: 'Biology Mid-term',
      subtitle: 'Biology · Hall C',
      right: 'Mar 2',
      chip: 'Completed',
      accentColor: const Color(0xFF9CA3AF),
      bucket: ClassExamBucket.past,
      chipTint: const Color(0xFFF3F4F6),
      chipText: const Color(0xFF6B7280),
    ),
  ];

  static final _seedVacations = <StudyVacationItem>[
    StudyVacationItem(
      id: 'v1',
      title: 'Eid ul Fitr Holiday',
      subtitle: 'Religious Holiday · 3 days',
      right: '3 days',
      chip: 'Mar 31 - Apr 2',
      start: DateTime(2026, 3, 31),
      end: DateTime(2026, 4, 2),
    ),
    StudyVacationItem(
      id: 'v2',
      title: 'Spring Break',
      subtitle: 'School Holiday · 1 week',
      right: '7 days',
      chip: 'Apr 14 - Apr 20',
      start: DateTime(2026, 4, 14),
      end: DateTime(2026, 4, 20),
    ),
    StudyVacationItem(
      id: 'v3',
      title: 'Summer Vacation',
      subtitle: 'School Holiday · 11 weeks',
      right: '76 days',
      chip: 'Jun 15 - Aug 30',
      start: DateTime(2026, 6, 15),
      end: DateTime(2026, 8, 30),
    ),
    StudyVacationItem(
      id: 'v4',
      title: 'Independence Day',
      subtitle: 'National Holiday',
      right: '1 day',
      chip: 'Aug 14',
      start: DateTime(2026, 8, 14),
      end: DateTime(2026, 8, 14),
    ),
    StudyVacationItem(
      id: 'v5',
      title: 'Winter Break',
      subtitle: 'School Holiday · 2 weeks',
      right: '15 days',
      chip: 'Dec 22 - Jan 5',
      start: DateTime(2026, 12, 22),
      end: DateTime(2027, 1, 5),
    ),
  ];

  static final _seedXtra = <StudyXtraItem>[
    const StudyXtraItem(
      id: 'x1',
      emoji: '📚',
      title: 'Group Study Session',
      subtitle: 'Mathematics · Library',
      time: '2 hrs',
      chip: 'Today, 4 PM',
      academic: true,
    ),
    const StudyXtraItem(
      id: 'x2',
      emoji: '📝',
      title: 'Project Meeting',
      subtitle: 'Computer Science · Lab 3',
      time: '1 hr',
      chip: 'Tomorrow, 2 PM',
      academic: true,
    ),
    const StudyXtraItem(
      id: 'x3',
      emoji: '🔬',
      title: 'Lab Session',
      subtitle: 'Chemistry · Lab 1',
      time: '3 hrs',
      chip: 'May 9, 11 AM',
      academic: true,
    ),
    const StudyXtraItem(
      id: 'x4',
      emoji: '🎓',
      title: 'Tutoring',
      subtitle: 'Physics · Office Hours',
      time: '1 hr',
      chip: 'May 10, 3 PM',
      academic: true,
    ),
    const StudyXtraItem(
      id: 'x5',
      emoji: '📖',
      title: 'Reading Club',
      subtitle: 'English · Room 112',
      time: '90 min',
      chip: 'May 11, 5 PM',
      academic: true,
    ),
    const StudyXtraItem(
      id: 'x6',
      emoji: '🏀',
      title: 'Basketball Practice',
      subtitle: 'Sports Hall',
      time: '2 hrs',
      chip: 'Wed, 5 PM',
      academic: false,
    ),
    const StudyXtraItem(
      id: 'x7',
      emoji: '🎵',
      title: 'Music Club',
      subtitle: 'Auditorium',
      time: '1 hr',
      chip: 'Fri, 4 PM',
      academic: false,
    ),
  ];

  static final _seedCalendarEvents = <StudyCalendarEvent>[
    StudyCalendarEvent(
      id: 'cal1',
      start: DateTime(2026, 5, 9, 9, 0),
      title: 'Mathematics',
      subtitle: 'Room 204',
      color: Color(0xFF25C55E),
      layer: CalendarFilterType.classes,
    ),
    StudyCalendarEvent(
      id: 'cal2',
      start: DateTime(2026, 5, 9, 11, 30),
      title: 'Physics Lab',
      subtitle: 'Lab 3',
      color: Color(0xFF9A4FF0),
      layer: CalendarFilterType.classes,
    ),
    StudyCalendarEvent(
      id: 'cal3',
      start: DateTime(2026, 5, 9, 14, 0),
      title: 'English Lit',
      subtitle: 'Room 112',
      color: Color(0xFF1CB6D0),
      layer: CalendarFilterType.classes,
    ),
    StudyCalendarEvent(
      id: 'cal4',
      start: DateTime(2026, 5, 10, 10, 0),
      title: 'Chemistry Quiz',
      subtitle: 'Lab 1',
      color: Color(0xFF23BED9),
      layer: CalendarFilterType.exams,
    ),
    StudyCalendarEvent(
      id: 'cal5',
      start: DateTime(2026, 5, 11, 17, 0),
      title: 'Reading Club',
      subtitle: 'Room 112',
      color: Color(0xFFF4D219),
      layer: CalendarFilterType.xtra,
    ),
    StudyCalendarEvent(
      id: 'cal6',
      start: DateTime(2026, 5, 14, 13, 0),
      title: 'Task: Lab report',
      subtitle: 'Due',
      color: Color(0xFF1DB5D0),
      layer: CalendarFilterType.tasks,
    ),
    StudyCalendarEvent(
      id: 'cal7',
      start: DateTime(2026, 6, 15, 8, 0),
      title: 'Summer break starts',
      subtitle: 'Holiday',
      color: Color(0xFFF6AB0C),
      layer: CalendarFilterType.holidays,
    ),
  ];

  @override
  List<StudySubject> get subjects => _subjects;

  @override
  List<StudyTaskItem> get tasks => _tasks;

  @override
  List<StudySessionItem> get classes => _classes;

  @override
  List<StudySessionItem> get exams => _exams;

  @override
  List<StudyVacationItem> get vacations => _vacations;

  @override
  List<StudyXtraItem> get xtraItems => _xtra;

  @override
  List<StudyCalendarEvent> get calendarEvents => _calendarEvents;

  @override
  List<String> get countryOptions => const [
      'United Kingdom',
    'India',
    'Pakistan',
        'United States',
        'Canada',
        'Australia',
        'Other',
      ];

  @override
  List<String> get academicYearOptions => const ['2025–2026', '2026–2027', '2027–2028', 'Manage Academic Years'];

  @override
  List<String> get weekdayOptions => const ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

  @override
  List<String> get classDurationOptions => const ['45 minutes', '50 minutes', '60 minutes', '90 minutes'];

  @override
  List<String> get reminderLeadOptions => const ['1 Minute', '5 Minutes', '10 Minutes', '15 Minutes', '30 Minutes'];

  @override
  List<String> get calendarProviderOptions => const ['Google Calendar', 'Microsoft Outlook', 'Apple iCloud', 'Other'];

  @override
  List<ManageSubjectRow> get manageSubjects => List<ManageSubjectRow>.unmodifiable(_manageSubjects);

  @override
  StudyUserProfile get userProfile => StudyUserProfile(
        displayName: 'John Parkinson',
        email: 'johnparkinson710@gmail.com',
        pendingTasksNext7Days: tasksDueCountInNextWeekFrom(DateTime.now()),
        overdueTasks: tasks.where((t) => t.bucket == TaskBucket.overdue).length,
        tasksCompletedLast7Days: tasks.where((t) => t.completed).length + 11,
        streakDays: 7,
        appVersionLabel: 'v8.0.14 (371)',
      );

  @override
  List<StudyTaskItem> filterTasks(TaskBucket bucket, String? subjectId) {
    return _tasks.where((t) => t.bucket == bucket && _subjectMatch(t.subjectId, subjectId)).toList();
  }

  @override
  List<StudySessionItem> filterClasses(ClassExamBucket bucket, String? subjectId) {
    return _classes.where((c) => c.bucket == bucket && _subjectMatch(c.subjectId, subjectId)).toList();
  }

  @override
  List<StudySessionItem> filterExams(ClassExamBucket bucket, String? subjectId) {
    return _exams.where((e) => e.bucket == bucket && _subjectMatch(e.subjectId, subjectId)).toList();
  }

  @override
  List<StudyVacationItem> filterVacations(VacationBucket bucket) {
    final now = DateTime.now();
    return _vacations.where((v) => v.bucketAt(now) == bucket).toList();
  }

  @override
  List<StudyXtraItem> filterXtra(XtraBucket bucket) {
    final academic = bucket == XtraBucket.academic;
    return _xtra.where((x) => x.academic == academic).toList();
  }

  @override
  List<StudyCalendarEvent> eventsOnDay(DateTime day) {
    return _calendarEvents.where((e) => _sameDate(e.start, day)).toList()..sort((a, b) => a.start.compareTo(b.start));
  }

  @override
  List<StudyHomeClass> homeClassesFor(DateTime day) {
    if (_sameDate(day, DateTime(2026, 5, 9))) {
      return [
        StudyHomeClass(
          subject: 'Mathematics',
          roomTeacher: 'Room 204 . Mr. Khan',
          time: '9:00 AM',
          color: const Color(0xFF21C45B),
          start: DateTime(2026, 5, 9, 9, 0),
        ),
        StudyHomeClass(
          subject: 'Physics Lab',
          roomTeacher: 'Lab 3 . Ms. Ahmed',
          time: '11:30 AM',
          color: const Color(0xFFA75AF8),
          start: DateTime(2026, 5, 9, 11, 30),
        ),
        StudyHomeClass(
          subject: 'English Lit',
          roomTeacher: 'Room 112',
          time: '2:00 PM',
          color: const Color(0xFFF5B11A),
          start: DateTime(2026, 5, 9, 14, 0),
        ),
      ];
    }
    return _calendarEvents
        .where((e) => _sameDate(e.start, day))
        .map(
          (e) => StudyHomeClass(
            subject: e.title,
            roomTeacher: e.subtitle,
            time: _formatTime(e.start),
            color: e.color,
            start: e.start,
          ),
        )
        .toList()
      ..sort((a, b) => a.start.compareTo(b.start));
  }

  @override
  List<StudyHomeTask> homeTasksDue({required int limit}) {
    final now = DateTime.now();
    final weekEnd = now.add(const Duration(days: 7));
    final upcoming = _tasks
        .where((t) => !t.completed && t.dueAt != null && !t.dueAt!.isBefore(now) && !t.dueAt!.isAfter(weekEnd))
        .toList()
      ..sort((a, b) => a.dueAt!.compareTo(b.dueAt!));

    return upcoming.take(limit).map((t) {
      final due = t.dueAt!;
      final today = DateTime(now.year, now.month, now.day);
      final dDay = DateTime(due.year, due.month, due.day);
      String dueText;
      if (dDay == today) {
        dueText = 'Due today';
      } else if (dDay == today.add(const Duration(days: 1))) {
        dueText = 'Due tomorrow';
      } else {
        dueText = 'Due ${_shortDate(due)}';
      }
      final trailing = dDay == today ? '!' : '➜';
      return StudyHomeTask(title: t.title, dueText: dueText, trailing: trailing, color: t.accentColor, dueAt: due);
    }).toList();
  }

  @override
  int classesCountOn(DateTime day) => homeClassesFor(day).length;

  @override
  int examsCountInNextWeekFrom(DateTime from) {
    return _exams.where((e) => e.bucket == ClassExamBucket.current).length;
  }

  @override
  int tasksDueCountInNextWeekFrom(DateTime from) {
    final end = from.add(const Duration(days: 7));
    return _tasks.where((t) {
      if (t.completed || t.dueAt == null) return false;
      final d = t.dueAt!;
      return !d.isBefore(from) && !d.isAfter(end);
    }).length;
  }

  static bool _subjectMatch(String? itemSubjectId, String? filterId) {
    if (filterId == null || filterId == 'all') return true;
    return itemSubjectId == filterId;
  }

  static bool _sameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  static String _formatTime(DateTime t) {
    final h = t.hour;
    final m = t.minute;
    final isPm = h >= 12;
    final h12 = h == 0 ? 12 : (h > 12 ? h - 12 : h);
    final mm = m.toString().padLeft(2, '0');
    return '$h12:$mm ${isPm ? 'PM' : 'AM'}';
  }

  static String _shortDate(DateTime d) {
    const m = ['', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${m[d.month]} ${d.day}';
  }
}
