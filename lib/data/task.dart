import 'package:deity_flexion_app/data/status.dart';

class Task {
  String id;
  String ownerId;
  String title;
  String description;
  String createdAt;
  Status status;

  Task({
    this.id,
    this.ownerId,
    this.title,
    this.description,
    this.createdAt,
    this.status,
  });
}
