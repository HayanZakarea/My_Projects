class ScheduleModel {
  final DateTime from;
  final DateTime to;
  final String note;

  ScheduleModel({
    required this.from,
    required this.to,
    required this.note,
  });

  Map<String,dynamic> get json => {
    'from':from.toIso8601String(),
    'to':to.toIso8601String(),
    'note':note
  };

}
