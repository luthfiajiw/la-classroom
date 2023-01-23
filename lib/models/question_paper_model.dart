import 'package:json_annotation/json_annotation.dart';

part 'question_paper_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Paper {
  String? id;
  String? title;
  @JsonKey(name: "image_url")
  String? imageUrl;
  @JsonKey(name: "Description")
  String? description;
  @JsonKey(name: "time_seconds")
  int? timeSeconds;
  List<Question>? questions;

  Paper({
    this.id,
    this.title,
    this.imageUrl,
    this.description,
    this.timeSeconds,
    List<Question>? questions
  }) : questions = questions ?? <Question>[];

  factory Paper.fromJson(Map<String, dynamic> json) => _$PaperFromJson(json);
  Map<String, dynamic> toJson() => _$PaperToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Question {
  String? id;
  String? question;
  @JsonKey(name: "correct_answer")
  String? correctAnswer;
  List<Answer>? answers;

  Question({
    this.id,
    this.question,
    this.correctAnswer,
    List<Answer>? answer
  }) : answers = answer ?? <Answer>[];

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Answer {
  String? identifier;
  @JsonKey(name: "Answer")
  String? answer;

  Answer({
    this.identifier,
    this.answer
  });

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}