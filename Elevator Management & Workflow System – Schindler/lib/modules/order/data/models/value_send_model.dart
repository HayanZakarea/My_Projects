
class ValueSendModel{

  final String title;
  final String value;

  ValueSendModel({required this.title,required  this.value});

  Map<String,dynamic> get json => {
    'title':title,
    'value':value,
  };

  @override
  String toString() => '$title : $value';

  @override
  int get hashCode => toString().hashCode;

  @override
  bool operator ==(Object other) => other.hashCode == hashCode;
}