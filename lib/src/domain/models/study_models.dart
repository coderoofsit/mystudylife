import 'package:flutter/material.dart';

/// Buckets used across list screens driven by segmented controls.
enum TaskBucket { current, past, overdue }

enum ClassExamBucket { current, past }

enum VacationBucket { upcoming, past }

enum XtraBucket { academic, nonAcademic }

enum CalendarViewMode { day, week, month }

/// Calendar overlay filter types (toggles).
enum CalendarFilterType { classes, exams, tasks, holidays, xtra, iCal }

extension CalendarFilterTypeX on CalendarFilterType {
  String get label {
    switch (this) {
      case CalendarFilterType.classes:
        return 'Classes';
      case CalendarFilterType.exams:
        return 'Exams';
      case CalendarFilterType.tasks:
        return 'Tasks';
      case CalendarFilterType.holidays:
        return 'Holidays';
      case CalendarFilterType.xtra:
        return 'Xtra';
      case CalendarFilterType.iCal:
        return 'ICal';
    }
  }

  Color get color {
    switch (this) {
      case CalendarFilterType.classes:
        return const Color(0xFF24C55E);
      case CalendarFilterType.exams:
        return const Color(0xFF9C4CF2);
      case CalendarFilterType.tasks:
        return const Color(0xFF1DB5D0);
      case CalendarFilterType.holidays:
        return const Color(0xFFF6AB0C);
      case CalendarFilterType.xtra:
        return const Color(0xFFF4D219);
      case CalendarFilterType.iCal:
        return const Color(0xFFF6973C);
    }
  }
}

class StudySubject {
  const StudySubject({required this.id, required this.name});

  final String id;
  final String name;

  StudySubject copyWith({String? id, String? name}) {
    return StudySubject(id: id ?? this.id, name: name ?? this.name);
  }
}

/// Task row rendered as the former `_InfoCard`.
class StudyTaskItem {
  const StudyTaskItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.right,
    required this.chip,
    required this.accentColor,
    required this.bucket,
    this.subjectId,
    this.chipTint = const Color(0xFFE5F7EA),
    this.chipText = const Color(0xFF236847),
    this.dueAt,
    this.completed = false,
  });

  final String id;
  final String title;
  final String subtitle;
  final String right;
  final String chip;
  final Color accentColor;
  final TaskBucket bucket;
  final String? subjectId;
  final Color chipTint;
  final Color chipText;
  final DateTime? dueAt;
  final bool completed;
}

/// Class or exam-style row (same card layout).
class StudySessionItem {
  const StudySessionItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.right,
    required this.chip,
    required this.accentColor,
    required this.bucket,
    this.subjectId,
    this.chipTint = const Color(0xFFE5F7EA),
    this.chipText = const Color(0xFF236847),
  });

  final String id;
  final String title;
  final String subtitle;
  final String right;
  final String chip;
  final Color accentColor;
  final ClassExamBucket bucket;
  final String? subjectId;
  final Color chipTint;
  final Color chipText;
}

class StudyVacationItem {
  const StudyVacationItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.right,
    required this.chip,
    required this.start,
    required this.end,
    this.accentColor = const Color(0xFFF6AB0C),
  });

  final String id;
  final String title;
  final String subtitle;
  final String right;
  final String chip;
  final DateTime start;
  final DateTime end;
  final Color accentColor;

  VacationBucket bucketAt(DateTime now) {
    final today = DateTime(now.year, now.month, now.day);
    final endDay = DateTime(end.year, end.month, end.day);
    return endDay.isBefore(today) ? VacationBucket.past : VacationBucket.upcoming;
  }
}

class StudyXtraItem {
  const StudyXtraItem({
    required this.id,
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.chip,
    required this.academic,
  });

  final String id;
  final String emoji;
  final String title;
  final String subtitle;
  final String time;
  final String chip;
  final bool academic;
}

/// Point-in-time calendar block for the timeline view.
class StudyCalendarEvent {
  const StudyCalendarEvent({
    required this.id,
    required this.start,
    required this.title,
    required this.subtitle,
    required this.color,
    this.layer = CalendarFilterType.classes,
  });

  final String id;
  final DateTime start;
  final String title;
  final String subtitle;
  final Color color;
  /// Which overlay filter toggles this event belongs to (dummy mapping).
  final CalendarFilterType layer;

  String get hourLabel {
    final h = start.hour;
    final m = start.minute;
    final isPm = h >= 12;
    final h12 = h == 0 ? 12 : (h > 12 ? h - 12 : h);
    final mm = m.toString().padLeft(2, '0');
    return '$h12:$mm ${isPm ? 'PM' : 'AM'}';
  }
}

/// Hero / home cards.
class StudyHomeClass {
  const StudyHomeClass({
    required this.subject,
    required this.roomTeacher,
    required this.time,
    required this.color,
    required this.start,
  });

  final String subject;
  final String roomTeacher;
  final String time;
  final Color color;
  final DateTime start;
}

class StudyHomeTask {
  const StudyHomeTask({
    required this.title,
    required this.dueText,
    required this.trailing,
    required this.color,
    required this.dueAt,
  });

  final String title;
  final String dueText;
  final String trailing;
  final Color color;
  final DateTime dueAt;
}

/// Row in “Manage Subjects”.
class ManageSubjectRow {
  const ManageSubjectRow({required this.id, required this.title, required this.color});

  final String id;
  final String title;
  final Color color;
}

class StudyUserProfile {
  const StudyUserProfile({
    required this.displayName,
    required this.email,
    required this.pendingTasksNext7Days,
    required this.overdueTasks,
    required this.tasksCompletedLast7Days,
    required this.streakDays,
    required this.appVersionLabel,
  });

  final String displayName;
  final String email;
  final int pendingTasksNext7Days;
  final int overdueTasks;
  final int tasksCompletedLast7Days;
  final int streakDays;
  final String appVersionLabel;
}
