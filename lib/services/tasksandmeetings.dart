import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addTask({
    required String taskSubject,
    required String taskDescription,
    required String taskContact,
    required DateTime taskDate,
    required String taskReminderTime,
  }) async {
    try {
      await _firestore.collection('tasks').add({
        'taskSubject': taskSubject,
        'taskDescription': taskDescription,
        'taskContact': taskContact,
        'taskDate': taskDate,
        'taskCreationTime': DateTime.now(),
        'taskReminderTime': taskReminderTime,
        'isCompleted': false,
      });
    } catch (e) {
      print('Error adding task: $e');
    }
  }

  Future<void> updateTaskCompletion(String taskId, bool isCompleted) async {
    try {
      await _firestore.collection('tasks').doc(taskId).update({
        'isCompleted': isCompleted,
      });
    } catch (e) {
      print('Error updating task completion: $e');
    }
  }

  Future<void> deleteTask(String taskId) async {
    try {
      await _firestore.collection('tasks').doc(taskId).delete();
    } catch (e) {
      print('Error deleting task: $e');
    }
  }

  Stream<QuerySnapshot> getTasksStream() {
    return _firestore.collection('tasks').snapshots();
  }

  Future<void> addMeeting({
    required String meetingSubject,
    required String meetingDescription,
    required String meetingContact,
    required DateTime meetingDate,
    required String meetingReminderTime,
  }) async {
    try {
      await _firestore.collection('meetings').add({
        'meetingSubject': meetingSubject,
        'meetingDescription': meetingDescription,
        'meetingContact': meetingContact,
        'meetingDate': meetingDate,
        'meetingCreationTime': DateTime.now(),
        'meetingReminderTime': meetingReminderTime,
        'isCompleted': false,
      });
    } catch (e) {
      print('Error adding meeting: $e');
    }
  }

  Future<void> updateMeetingCompletion(String meetingId, bool isCompleted) async {
    try {
      await _firestore.collection('meetings').doc(meetingId).update({
        'isCompleted': isCompleted,
      });
    } catch (e) {
      print('Error updating meeting completion: $e');
    }
  }

  Future<void> deleteMeeting(String meetingId) async {
    try {
      await _firestore.collection('meetings').doc(meetingId).delete();
    } catch (e) {
      print('Error deleting meeting: $e');
    }
  }

  Stream<QuerySnapshot> getMeetingsStream() {
    return _firestore.collection('meetings').snapshots();
  }
}
