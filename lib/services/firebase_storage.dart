import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deity_flexion_app/data/status.dart';
import 'package:deity_flexion_app/data/task.dart';

class FirebaseStorageHelper {
  static Future<List<Task>> getTasksByUid(String uid) async {
    CollectionReference tasksRef =
        FirebaseFirestore.instance.collection('tasks');

    List<Task> resultTasks = [];

    QuerySnapshot snapshots = await tasksRef
        .where('ownerUid', isEqualTo: uid)
        .orderBy('createdAt')
        .get();

    snapshots.docs.forEach((element) {
      Map<String, dynamic> elementData = element.data();
      resultTasks.add(
        new Task(
          id: element.id,
          status: StatusHelper.getStatusByString(elementData['status']),
          ownerId: elementData['ownerUid'],
          title: elementData['title'],
          description: elementData['description'],
          createdAt: elementData['createdAt'],
        ),
      );
    });

    return resultTasks;
  }

  static Future<Task> addTask({Task task}) async {
    CollectionReference tasksRef =
        FirebaseFirestore.instance.collection('tasks');

    DocumentReference doc = await tasksRef.add({
      'status': StatusHelper.getStringByStatus(task.status),
      'ownerUid': task.ownerId,
      'title': task.title,
      'description': task.description,
      'createdAt': task.createdAt,
    });

    DocumentSnapshot snapshot = await doc.get();
    task.id = snapshot.id;

    return task;
  }

  static Future<Task> updateTask({Task task}) async {
    DocumentReference taskRef =
        FirebaseFirestore.instance.collection('tasks').doc(task.id);

    await taskRef.update({
      'status': StatusHelper.getStringByStatus(task.status),
      'ownerUid': task.ownerId,
      'title': task.title,
      'description': task.description,
    });

    return task;
  }

  static Future<bool> deleteTask({ String taskId }) async {
    await FirebaseFirestore.instance.collection('tasks').doc(taskId).delete();

    return true;
  }
}
