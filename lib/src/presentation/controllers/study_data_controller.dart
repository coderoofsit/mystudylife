import 'package:get/get.dart';

import '../../data/study_repository.dart';
import '../../domain/models/study_models.dart';

/// Central UI state for study lists, filters, and preferences (backed by [StudyRepository]).
class StudyDataController extends GetxController {
  StudyDataController(this._repo);

  final StudyRepository _repo;

  // —— List filters ——
  final taskSegment = TaskBucket.current.obs;
  final classSegment = ClassExamBucket.current.obs;
  final examSegment = ClassExamBucket.current.obs;
  final vacationSegment = VacationBucket.upcoming.obs;
  final xtraSegment = XtraBucket.academic.obs;

  final selectedTaskSubjectId = 'all'.obs;
  final selectedClassSubjectId = 'all'.obs;
  final selectedExamSubjectId = 'all'.obs;

  final filteredTasks = <StudyTaskItem>[].obs;
  final filteredClasses = <StudySessionItem>[].obs;
  final filteredExams = <StudySessionItem>[].obs;
  final filteredVacations = <StudyVacationItem>[].obs;
  final filteredXtra = <StudyXtraItem>[].obs;

  // —— Calendar / timeline ——
  final calendarViewMode = CalendarViewMode.day.obs;
  final focusedDay = DateTime.now().obs;
  final calendarFilters = <CalendarFilterType, bool>{
    CalendarFilterType.classes: true,
    CalendarFilterType.exams: true,
    CalendarFilterType.tasks: true,
    CalendarFilterType.holidays: true,
    CalendarFilterType.xtra: true,
    CalendarFilterType.iCal: true,
  }.obs;

  List<StudySubject> get filterSubjects => _repo.subjects.where((s) => s.id != 'all').toList();

  List<DropdownSubjectOption> get taskSubjectDropdown => [
        DropdownSubjectOption(id: 'all', label: _repo.subjects.firstWhere((s) => s.id == 'all').name),
        ...filterSubjects.map((s) => DropdownSubjectOption(id: s.id, label: s.name)),
      ];

  // —— Personalization ——
  final personalizeCountryIndex = 0.obs;
  final personalizeDateFormatIndex = 0.obs;
  final personalizeTimeFormatIndex = 0.obs;
  final personalizeDashboardDaysIndex = 1.obs;
  final personalizeConfettiOn = true.obs;
  final personalizeShowCompletedTasks = true.obs;

  // —— Schedule setup ——
  final scheduleYearIndex = 0.obs;
  final scheduleTypeIndex = 0.obs;
  final scheduleFirstWeekdayIndex = 0.obs;
  final scheduleDurationIndex = 2.obs;
  final scheduleBumpHolidays = true.obs;

  final defaultStartHour = 9.obs;
  final defaultStartMinute = 0.obs;

  // —— Reminders ——
  final remindersEnabled = true.obs;
  final reminderSoundEnabled = true.obs;
  final reminderVibrateEnabled = true.obs;
  final classReminderEnabled = true.obs;
  final classReminderLeadIndex = 1.obs;
  final examReminderEnabled = true.obs;
  final examReminderLeadIndex = 1.obs;

  // —— Calendar sync draft ——
  final calendarProviderIndex = 0.obs;

  final syncTitleController = ''.obs;
  final syncUrlController = ''.obs;

  // —— Appearance ——
  final darkModeEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
    syncTitleController.value = 'School Timetable';
    syncUrlController.value = 'https://calendar.google.com/calendar/ical/...';

    everAll([
      taskSegment,
      selectedTaskSubjectId,
    ], (_) => _rebuildTasks());

    everAll([
      classSegment,
      selectedClassSubjectId,
    ], (_) => _rebuildClasses());

    everAll([
      examSegment,
      selectedExamSubjectId,
    ], (_) => _rebuildExams());

    ever(vacationSegment, (_) => _rebuildVacations());
    ever(xtraSegment, (_) => _rebuildXtra());

    _rebuildTasks();
    _rebuildClasses();
    _rebuildExams();
    _rebuildVacations();
    _rebuildXtra();
  }

  void _rebuildTasks() => filteredTasks.assignAll(_repo.filterTasks(taskSegment.value, selectedTaskSubjectId.value));

  void _rebuildClasses() =>
      filteredClasses.assignAll(_repo.filterClasses(classSegment.value, selectedClassSubjectId.value));

  void _rebuildExams() => filteredExams.assignAll(_repo.filterExams(examSegment.value, selectedExamSubjectId.value));

  void _rebuildVacations() => filteredVacations.assignAll(_repo.filterVacations(vacationSegment.value));

  void _rebuildXtra() => filteredXtra.assignAll(_repo.filterXtra(xtraSegment.value));

  void setCalendarFilter(CalendarFilterType type, bool enabled) {
    calendarFilters[type] = enabled;
    calendarFilters.refresh();
  }

  void toggleCalendarFilter(CalendarFilterType type) {
    calendarFilters[type] = !(calendarFilters[type] ?? true);
    calendarFilters.refresh();
  }

  bool calendarFilterActive(CalendarFilterType type) => calendarFilters[type] ?? true;

  void shiftFocusedMonth(int months) {
    final d = focusedDay.value;
    focusedDay.value = DateTime(d.year, d.month + months, d.day);
  }

  void goToToday() => focusedDay.value = DateTime.now();

  StudyUserProfile get userProfile => _repo.userProfile;

  List<String> get countryOptions => _repo.countryOptions;
  List<String> get academicYearOptions => _repo.academicYearOptions;
  List<String> get weekdayOptions => _repo.weekdayOptions;
  List<String> get classDurationOptions => _repo.classDurationOptions;
  List<String> get reminderLeadOptions => _repo.reminderLeadOptions;
  List<String> get calendarProviderOptions => _repo.calendarProviderOptions;

  List<StudyHomeClass> homeClassesToday() => _repo.homeClassesFor(DateTime.now());

  List<StudyHomeTask> homeTasksDue() => _repo.homeTasksDue(limit: 4);

  String homeWeekdayLabel() {
    const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    final n = DateTime.now().weekday - 1;
    return days[n.clamp(0, 6)];
  }

  String homeDateLabel() {
    final now = DateTime.now();
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${months[now.month - 1]} ${now.day}, ${now.year}';
  }

  ({int classes, int exams, int tasks}) homeSummaryCounts() {
    final now = DateTime.now();
    return (
      classes: _repo.classesCountOn(now),
      exams: _repo.examsCountInNextWeekFrom(now),
      tasks: _repo.tasksDueCountInNextWeekFrom(now),
    );
  }

  List<StudyCalendarEvent> timelineEventsForFocusedDay() {
    final raw = _repo.eventsOnDay(focusedDay.value);
    return raw.where((e) => calendarFilterActive(e.layer)).toList();
  }

  /// Hour slots for timeline (9–18 shown in original UI as 9 AM … 6 PM).
  Iterable<int> timelineHours() sync* {
    for (var h = 9; h <= 18; h++) {
      yield h;
    }
  }

  List<StudyCalendarEvent> eventsInHour(DateTime day, int hour) {
    return timelineEventsForFocusedDay().where((e) => e.start.hour == hour).toList();
  }

  String focusedMonthYearLabel() {
    final d = focusedDay.value;
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${months[d.month - 1]} ${d.year}';
  }

  String focusedWeekdayAbbrev() {
    const days = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
    return days[(focusedDay.value.weekday - 1).clamp(0, 6)];
  }

  String focusedDayNumber() => '${focusedDay.value.day}';
}

class DropdownSubjectOption {
  const DropdownSubjectOption({required this.id, required this.label});
  final String id;
  final String label;
}
