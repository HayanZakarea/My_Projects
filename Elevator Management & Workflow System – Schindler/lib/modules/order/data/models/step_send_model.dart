
class StepSendModel {

  final int roleId;
  final String name;
  final bool hasReport;
  final bool canUpdate;
  final int arrangement;
  final List<String> reportValues;

  StepSendModel({
      required this.roleId,
      required this.name,
      required this.hasReport,
      required this.canUpdate,
      required this.arrangement,
      required this.reportValues
  });


  Map<String,dynamic> get json => {
    'role_id':roleId.toString(),
    'name':name,
    'has_report':hasReport ? "1" :"0",
    'can_update':canUpdate ? "1" :"0",
    'arrangement':arrangement.toString() ,
    'report_values':reportValues.map((e) => {
      'question':e,
      'type':'center big'
    }).toList(),
  };
}
