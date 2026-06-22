
import 'dart:convert';

class FormModel {
  final int id;
  final String question;
  final String type;
  final List<String> answers;

  FormModel({
    required this.id,
    required this.question,
    required this.type,
    required this.answers,
  });

  factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
    id: json["id"],
    type: json['type'],
    question: json['question'],
    answers: (jsonDecode(json['answers'] ?? "[]") as List).map((e) => e.toString()).toList()
  );


}
