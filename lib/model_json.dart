// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.status,
    required this.message,
    required this.data,
    required this.errors,
  });

  bool status;
  String message;
  Data data;
  String errors;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
    errors: json["errors"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
    "errors": errors,
  };
}

class Data {
  Data({
    required this.course,
    required this.documents,
    required this.videos,
    required this.questions,
  });

  Course course;
  List<Document> documents;
  List<Document> videos;
  List<Question> questions;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    course: Course.fromJson(json["course"]),
    documents: List<Document>.from(json["documents"].map((x) => Document.fromJson(x))),
    videos: List<Document>.from(json["videos"].map((x) => Document.fromJson(x))),
    questions: List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "course": course.toJson(),
    "documents": List<dynamic>.from(documents.map((x) => x.toJson())),
    "videos": List<dynamic>.from(videos.map((x) => x.toJson())),
    "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
  };
}

class Course {
  Course({
    required this.id,
    required this.name,
    required this.description,
    required this.cost,
  });

  int id;
  String name;
  String description;
  int cost;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    cost: json["cost"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "cost": cost,
  };
}

class Document {
  Document({
    required this.id,
    required this.productId,
    required this.title,
    required this.type,
    required this.document,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.url,
  });

  int id;
  int productId;
  String title;
  String type;
  String document;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String url;

  factory Document.fromJson(Map<String, dynamic> json) => Document(
    id: json["id"],
    productId: json["product_id"],
    title: json["title"],
    type: json["type"] == null ? null : json["type"],
    document: json["document"] == null ? null : json["document"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "title": title,
    "type": type == null ? null : type,
    "document": document == null ? null : document,
    "deleted_at": deletedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "url": url == null ? null : url,
  };
}

class Question {
  Question({
    required this.id,
    required this.productId,
    required this.question,
    required this.answer,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int productId;
  String question;
  String answer;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    id: json["id"],
    productId: json["product_id"],
    question: json["question"],
    answer: json["answer"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "question": question,
    "answer": answer,
    "deleted_at": deletedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
