import '../domain/models/study_models.dart';

/// Read-only source of study data. Swap implementation for API later.
abstract class StudyRepository {
  List<StudySubject> get subjects;

  List<StudyTaskItem> get tasks;

  List<StudySessionItem> get classes;

  List<StudySessionItem> get exams;

  List<StudyVacationItem> get vacations;

  List<StudyXtraItem> get xtraItems;

  List<StudyCalendarEvent> get calendarEvents;

  List<StudyHomeClass> homeClassesFor(DateTime day);

  List<StudyHomeTask> homeTasksDue({required int limit});

  StudyUserProfile get userProfile;

  List<String> get countryOptions;

  List<String> get academicYearOptions;

  List<String> get weekdayOptions;

  List<String> get classDurationOptions;

  List<String> get reminderLeadOptions;

  List<String> get calendarProviderOptions;

  List<ManageSubjectRow> get manageSubjects;

  List<StudyTaskItem> filterTasks(TaskBucket bucket, String? subjectId);

  List<StudySessionItem> filterClasses(ClassExamBucket bucket, String? subjectId);

  List<StudySessionItem> filterExams(ClassExamBucket bucket, String? subjectId);

  List<StudyVacationItem> filterVacations(VacationBucket bucket);

  List<StudyXtraItem> filterXtra(XtraBucket bucket);

  List<StudyCalendarEvent> eventsOnDay(DateTime day);

  int classesCountOn(DateTime day);

  int examsCountInNextWeekFrom(DateTime from);

  int tasksDueCountInNextWeekFrom(DateTime from);
}
