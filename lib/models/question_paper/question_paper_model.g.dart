// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_paper_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Paper _$PaperFromJson(Map<String, dynamic> json) => Paper(
      id: json['id'] as String?,
      title: json['title'] as String?,
      imageUrl: json['image_url'] as String?,
      description: json['Description'] as String?,
      timeSeconds: json['time_seconds'] as int?,
      questionsCount: json['questions_count'] as int?,
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaperToJson(Paper instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image_url': instance.imageUrl,
      'Description': instance.description,
      'time_seconds': instance.timeSeconds,
      'questions_count': instance.questionsCount,
      'questions': instance.questions?.map((e) => e.toJson()).toList(),
    };

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      id: json['id'] as String?,
      question: json['question'] as String?,
      correctAnswer: json['correct_answer'] as String?,
    )..answers = (json['answers'] as List<dynamic>?)
        ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'correct_answer': instance.correctAnswer,
      'answers': instance.answers?.map((e) => e.toJson()).toList(),
    };

Answer _$AnswerFromJson(Map<String, dynamic> json) => Answer(
      identifier: json['identifier'] as String?,
      answer: json['Answer'] as String?,
    );

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'identifier': instance.identifier,
      'Answer': instance.answer,
    };
