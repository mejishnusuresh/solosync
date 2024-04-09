
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});

  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection("users");

  final CollectionReference taskCollection =
  FirebaseFirestore.instance.collection("tasks");

  final CollectionReference meetingCollection =
  FirebaseFirestore.instance.collection("meetings");



  // Storing user data
  Future savingUserData(String email) async {
    return await userCollection.doc(uid).set({
      "fullName": "",
      "companyName": "",
      "companyAddress":"",
      "mobile": "",
      "email": email,
      "department": "",
      "address": "",
      "profilePic": "",
      "uid": uid,
    });
  }

  // getting user data
  Future<List<DocumentSnapshot>> gettingUserData(String email, String phone) async {
    QuerySnapshot emailSnapshot = await userCollection
        .where("email", isEqualTo: email)
        .get();

    QuerySnapshot phoneSnapshot = await userCollection
        .where("phone", isEqualTo: phone)
        .get();

    List<DocumentSnapshot> documents = [];
    documents.addAll(emailSnapshot.docs);
    documents.addAll(phoneSnapshot.docs);

    return documents;
  }

  Future<void> createTask(String taskName, String id, String contact) async {
    try {
      await taskCollection.add({
        "taskName": taskName,
        "contact": contact,
      });
    } catch (e) {
      print("Error creating task: $e");
    }
  }

  Future<void> deleteUserData() async {
    try {
      if (uid != null) {
        await userCollection.doc(uid).delete();
      }
    } catch (e) {
      print("Error deleting user data: $e");
    }
  }

  Stream<DocumentSnapshot> getUserData() {
    try {
      return userCollection.doc(uid).snapshots();
    } catch (e) {
      print("Error getting user data: $e");
      return Stream.empty();
    }
  }



  // get user tasks
  getUserTasks() async {
    return userCollection.doc(uid).snapshots();
  }


}