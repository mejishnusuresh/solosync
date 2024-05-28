// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/widgets.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:intl/intl.dart';
// // import 'package:solosync/screens/addmeeting.dart';
// // import 'package:solosync/screens/addtask.dart';
// // import 'package:solosync/screens/taskdetails.dart';
// // import 'package:solosync/services/tasksandmeetings.dart';
// //
// // class HomePage extends StatefulWidget {
// //   final GlobalKey<ScaffoldState> scaffoldKey;
// //
// //   const HomePage({Key? key, required this.scaffoldKey}) : super(key: key);
// //
// //   @override
// //   State<HomePage> createState() => _HomePageState(scaffoldKey: scaffoldKey);
// // }
// //
// // class _HomePageState extends State<HomePage> {
// //   final GlobalKey<ScaffoldState> scaffoldKey;
// //
// //   _HomePageState({required this.scaffoldKey});
// //   int _currentTaskTab = 1;
// //   int _currentMeetingTab = 1;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         body: Stack(alignment: Alignment.center, children: [
// //       Container(
// //         color: Theme.of(context).primaryColor,
// //       ),
// //       Positioned(
// //         top: 60,
// //         left: 3,
// //         child: Container(
// //           width: 50,
// //           height: 50,
// //           child: IconButton(
// //             onPressed: () {
// //               scaffoldKey.currentState!.openDrawer();
// //             },
// //             icon: const Icon(Icons.menu_rounded, color: Colors.white, size: 30),
// //           ),
// //         ),
// //       ),
// //       Positioned(
// //         top: 110,
// //         left: 0,
// //         right: 0,
// //         bottom: 0,
// //         child: Container(
// //           height: MediaQuery.of(context).size.height,
// //           decoration: const BoxDecoration(
// //             borderRadius: BorderRadius.only(
// //               topLeft: Radius.circular(20.0),
// //               topRight: Radius.circular(20.0),
// //             ),
// //             color: Colors.white,
// //           ),
// //           child: Padding(
// //             padding: const EdgeInsets.only(left: 10.0, right: 10.0),
// //             child: ListView(
// //               children: [
// //                 Card(
// //                   color: Colors.white,
// //                   elevation: 4,
// //                   child: Padding(
// //                     padding: const EdgeInsets.all(10.0),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                           children: [
// //                             Text('  Tasks',
// //                                 style: GoogleFonts.inter(
// //                                   textStyle: const TextStyle(
// //                                       fontSize: 16,
// //                                       fontWeight: FontWeight.bold),
// //                                 )),
// //                             GestureDetector(
// //                               child: Text(
// //                                 'See all   ',
// //                                 style: GoogleFonts.inter(
// //                                     textStyle: TextStyle(
// //                                         fontSize: 12,
// //                                         color: Theme.of(context).primaryColor)),
// //                               ),
// //                               onTap: () {},
// //                             ),
// //                           ],
// //                         ),
// //                         const SizedBox(height: 20),
// //                         Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                           children: [
// //                             _buildTaskTabContainer("Today"),
// //                             _buildTaskTabContainer("Next"),
// //                             _buildTaskTabContainer("Overdue"),
// //                             _buildTaskTabContainer("Done"),
// //                           ],
// //                         ),
// //                         Container(
// //                           child: _buildTaskTabContent(),
// //                         ),
// //                         SizedBox(
// //                           height: 10,
// //                         ),
// //                         GestureDetector(
// //                           onTap: () {
// //                             Navigator.push(
// //                               context,
// //                               MaterialPageRoute(
// //                                   builder: (context) => const AddTask()),
// //                             );
// //                           },
// //                           child: Row(
// //                             mainAxisAlignment: MainAxisAlignment.center,
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               const Icon(
// //                                 Icons.add,
// //                                 size: 18,
// //                               ),
// //                               const SizedBox(width: 8),
// //                               Text('Create a Task',
// //                                   style: GoogleFonts.inter(
// //                                     textStyle: const TextStyle(
// //                                         color: Colors.grey, fontSize: 14),
// //                                   )),
// //                             ],
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 20),
// //                 Card(
// //                   color: Colors.white,
// //                   elevation: 4,
// //                   child: Padding(
// //                     padding: const EdgeInsets.all(10.0),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                           children: [
// //                             Text('  Meetings',
// //                                 style: GoogleFonts.inter(
// //                                   textStyle: const TextStyle(
// //                                       fontSize: 16,
// //                                       fontWeight: FontWeight.bold),
// //                                 )),
// //                             Text(
// //                               'See all   ',
// //                               style: GoogleFonts.inter(
// //                                   textStyle: TextStyle(
// //                                       fontSize: 12,
// //                                       color: Theme.of(context).primaryColor)),
// //                             ),
// //                           ],
// //                         ),
// //                         const SizedBox(height: 20),
// //                         Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                           children: [
// //                             _buildMeetingTabContainer("Today"),
// //                             _buildMeetingTabContainer("Next"),
// //                             _buildMeetingTabContainer("Overdue"),
// //                             _buildMeetingTabContainer("Done"),
// //                           ],
// //                         ),
// //                         Container(
// //                           child: _buildMeetingTabContent(),
// //                         ),
// //                         const SizedBox(height: 10),
// //                         GestureDetector(
// //                           onTap: () {
// //                             Navigator.push(
// //                               context,
// //                               MaterialPageRoute(
// //                                   builder: (context) => const AddMeeting()),
// //                             );
// //                           },
// //                           child: Row(
// //                             mainAxisAlignment: MainAxisAlignment.center,
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               const Icon(
// //                                 Icons.add,
// //                                 size: 18,
// //                               ),
// //                               const SizedBox(width: 8),
// //                               Text('Create a Meeting',
// //                                   style: GoogleFonts.inter(
// //                                     textStyle: const TextStyle(
// //                                         color: Colors.grey, fontSize: 14),
// //                                   )),
// //                             ],
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     ]));
// //   }
// //
// //   // task
// //
// //   Widget _buildTaskTabContainer(String text) {
// //     return GestureDetector(
// //       onTap: () {
// //         setState(() {
// //           switch (text) {
// //             case "Today":
// //               _currentTaskTab = 1;
// //               break;
// //             case "Next":
// //               _currentTaskTab = 2;
// //               break;
// //             case "Overdue":
// //               _currentTaskTab = 3;
// //               break;
// //             case "Done":
// //               _currentTaskTab = 4;
// //               break;
// //           }
// //         });
// //       },
// //       child: Container(
// //         width: 75,
// //         height: 35,
// //         decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(10),
// //             color: _currentTaskTab == _getTaskTabNumber(text)
// //                 ? Theme.of(context).primaryColor.withOpacity(0.2)
// //                 : Theme.of(context).primaryColor.withOpacity(0.1)),
// //         child: Center(
// //           child: Text(
// //             text,
// //             style: GoogleFonts.inter(
// //               textStyle: TextStyle(
// //                 color: _currentTaskTab == _getTaskTabNumber(text)
// //                     ? Theme.of(context).primaryColor
// //                     : Colors.black,
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildTaskTabContent() {
// //     switch (_currentTaskTab) {
// //       case 1:
// //         return SizedBox(
// //           width: MediaQuery.of(context).size.width,
// //           child: SingleChildScrollView(
// //             child: Column(
// //               children: [
// //                 StreamBuilder<QuerySnapshot>(
// //                   stream: FirebaseFirestore.instance
// //                       .collection('tasks')
// //                       .where('isCompleted', isEqualTo: false)
// //                       .snapshots(),
// //                   builder: (context, snapshot) {
// //                     if (snapshot.hasData) {
// //                       List<DocumentSnapshot> tasks = snapshot.data!.docs;
// //                       List<DocumentSnapshot> todayTasks = tasks.where((task) {
// //                         DateTime? taskDate = task['taskDate']?.toDate();
// //                         return taskDate != null &&
// //                             isSameDay(taskDate, DateTime.now());
// //                       }).toList();
// //
// //                       return ListView.builder(
// //                         shrinkWrap: true,
// //                         physics: const NeverScrollableScrollPhysics(),
// //                         itemCount: todayTasks.length,
// //                         itemBuilder: (context, index) {
// //                           final doc = todayTasks[index];
// //                           Map<String, dynamic> data =
// //                               doc.data() as Map<String, dynamic>;
// //                           DateTime? dateTime;
// //                           if (data['taskDate'] != null) {
// //                             dateTime = data['taskDate'].toDate();
// //                           }
// //                           return ListTile(
// //                             title: Text(data['taskSubject']),
// //                             subtitle: Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 Text(
// //                                   data['taskDescription'],
// //                                   style: const TextStyle(
// //                                     fontSize: 13,
// //                                     color: Colors.grey,
// //                                   ),
// //                                 ),
// //                                 Row(
// //                                   children: [
// //                                     const Icon(
// //                                       Icons.calendar_today_outlined,
// //                                       size: 14,
// //                                       color: Colors.grey,
// //                                     ),
// //                                     const SizedBox(width: 4),
// //                                     Text(
// //                                       DateFormat.yMMMd()
// //                                           .add_jm()
// //                                           .format(dateTime!),
// //                                       style: const TextStyle(
// //                                         color: Colors.grey,
// //                                         fontSize: 12,
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ],
// //                             ),
// //                             leading: RoundCheckbox(
// //                               value: data['isCompleted'] ?? false,
// //                               onChanged: (value) {
// //                                 FirebaseService().updateTaskCompletion(
// //                                     doc.id, value ?? false);
// //                               },
// //                             ),
// //                             onTap: () {
// //                               Navigator.push(
// //                                 context,
// //                                 MaterialPageRoute(
// //                                     builder: (context) => TaskDetails()),
// //                               );
// //                             },
// //                           );
// //                         },
// //                       );
// //                     } else {
// //                       return const CircularProgressIndicator();
// //                     }
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //
// //       case 2:
// //         return SizedBox(
// //           width: MediaQuery.of(context).size.width,
// //           child: SingleChildScrollView(
// //             child: Column(
// //               children: [
// //                 StreamBuilder<QuerySnapshot>(
// //                   stream: FirebaseFirestore.instance
// //                       .collection('tasks')
// //                       .where('isCompleted', isEqualTo: false)
// //                       .snapshots(),
// //                   builder: (context, snapshot) {
// //                     if (snapshot.hasData) {
// //                       List<DocumentSnapshot> tasks = snapshot.data!.docs;
// //                       List<DocumentSnapshot> nextDayTasks = tasks.where((task) {
// //                         DateTime? taskDate = task['taskDate']?.toDate();
// //                         return taskDate != null &&
// //                             taskDate.isAfter(DateTime.now()) &&
// //                             !isSameDay(taskDate, DateTime.now());
// //                       }).toList();
// //
// //                       return ListView.builder(
// //                         shrinkWrap: true,
// //                         physics: const NeverScrollableScrollPhysics(),
// //                         itemCount: nextDayTasks.length,
// //                         itemBuilder: (context, index) {
// //                           final doc = nextDayTasks[index];
// //                           Map<String, dynamic> data =
// //                               doc.data() as Map<String, dynamic>;
// //                           DateTime? dateTime;
// //                           if (data['taskDate'] != null) {
// //                             dateTime = data['taskDate'].toDate();
// //                           }
// //                           return ListTile(
// //                             title: Text(data['taskSubject']),
// //                             subtitle: Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 Text(
// //                                   data['taskDescription'],
// //                                   style: const TextStyle(
// //                                     fontSize: 13,
// //                                     color: Colors.grey,
// //                                   ),
// //                                 ),
// //                                 Row(
// //                                   children: [
// //                                     const Icon(
// //                                       Icons.calendar_today_outlined,
// //                                       size: 14,
// //                                       color: Colors.grey,
// //                                     ),
// //                                     const SizedBox(width: 4),
// //                                     Text(
// //                                       DateFormat.yMMMd()
// //                                           .add_jm()
// //                                           .format(dateTime!),
// //                                       style: const TextStyle(
// //                                         color: Colors.grey,
// //                                         fontSize: 12,
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ],
// //                             ),
// //                             leading: RoundCheckbox(
// //                               value: data['isCompleted'] ?? false,
// //                               onChanged: (value) {
// //                                 FirebaseService().updateTaskCompletion(
// //                                     doc.id, value ?? false);
// //                               },
// //                             ),
// //                             onTap: () {
// //                               // Add any onTap behavior here
// //                             },
// //                           );
// //                         },
// //                       );
// //                     } else {
// //                       return const CircularProgressIndicator();
// //                     }
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //
// //       case 3:
// //         return SizedBox(
// //           width: MediaQuery.of(context).size.width,
// //           child: SingleChildScrollView(
// //             child: Column(
// //               children: [
// //                 StreamBuilder<QuerySnapshot>(
// //                   stream: FirebaseFirestore.instance
// //                       .collection('tasks')
// //                       .where('isCompleted', isEqualTo: false)
// //                       .snapshots(),
// //                   builder: (context, snapshot) {
// //                     if (snapshot.hasData) {
// //                       List<DocumentSnapshot> tasks = snapshot.data!.docs;
// //                       List<DocumentSnapshot> overdueTasks = tasks.where((task) {
// //                         DateTime? taskDate = task['taskDate']?.toDate();
// //                         return taskDate != null &&
// //                             taskDate.isBefore(DateTime.now()) &&
// //                             !isSameDay(taskDate, DateTime.now());
// //                       }).toList();
// //
// //                       return ListView.builder(
// //                         shrinkWrap: true,
// //                         physics: const NeverScrollableScrollPhysics(),
// //                         itemCount: overdueTasks.length,
// //                         itemBuilder: (context, index) {
// //                           final doc = overdueTasks[index];
// //                           Map<String, dynamic> data =
// //                               doc.data() as Map<String, dynamic>;
// //                           DateTime? dateTime;
// //                           if (data['taskDate'] != null) {
// //                             dateTime = data['taskDate'].toDate();
// //                           }
// //                           return ListTile(
// //                             title: Text(data['taskSubject']),
// //                             subtitle: Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 Text(
// //                                   data['taskDescription'],
// //                                   style: const TextStyle(
// //                                     fontSize: 13,
// //                                     color: Colors.grey,
// //                                   ),
// //                                 ),
// //                                 Row(
// //                                   children: [
// //                                     const Icon(
// //                                       Icons.calendar_today_outlined,
// //                                       size: 14,
// //                                       color: Colors.grey,
// //                                     ),
// //                                     const SizedBox(width: 4),
// //                                     Text(
// //                                       DateFormat.yMMMd()
// //                                           .add_jm()
// //                                           .format(dateTime!),
// //                                       style: const TextStyle(
// //                                         color: Colors.grey,
// //                                         fontSize: 12,
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ],
// //                             ),
// //                             leading: RoundCheckbox(
// //                               value: data['isCompleted'] ?? false,
// //                               onChanged: (value) {
// //                                 FirebaseService().updateTaskCompletion(
// //                                     doc.id, value ?? false);
// //                               },
// //                             ),
// //                             onTap: () {
// //                               // Add any onTap behavior here
// //                             },
// //                           );
// //                         },
// //                       );
// //                     } else {
// //                       return const CircularProgressIndicator();
// //                     }
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //
// //       case 4:
// //         return SizedBox(
// //           width: MediaQuery.of(context).size.width,
// //           child: SingleChildScrollView(
// //             child: Column(
// //               children: [
// //                 StreamBuilder<QuerySnapshot>(
// //                   stream: FirebaseFirestore.instance
// //                       .collection('tasks')
// //                       .where('isCompleted', isEqualTo: true)
// //                       .snapshots(),
// //                   builder: (context, snapshot) {
// //                     if (snapshot.hasData) {
// //                       List<DocumentSnapshot> tasks = snapshot.data!.docs;
// //                       return ListView.builder(
// //                         shrinkWrap: true,
// //                         physics: const NeverScrollableScrollPhysics(),
// //                         itemCount: tasks.length,
// //                         itemBuilder: (context, index) {
// //                           final doc = tasks[index];
// //                           Map<String, dynamic> data =
// //                               doc.data() as Map<String, dynamic>;
// //                           DateTime? dateTime;
// //                           if (data['taskDate'] != null) {
// //                             dateTime = data['taskDate'].toDate();
// //                           }
// //                           return ListTile(
// //                             title: Text(data['taskSubject']),
// //                             subtitle: Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 Text(
// //                                   data['taskDescription'],
// //                                   style: const TextStyle(
// //                                     fontSize: 13,
// //                                     color: Colors.grey,
// //                                   ),
// //                                 ),
// //                                 Row(
// //                                   children: [
// //                                     const Icon(
// //                                       Icons.calendar_today_outlined,
// //                                       size: 14,
// //                                       color: Colors.grey,
// //                                     ),
// //                                     const SizedBox(width: 4),
// //                                     Text(
// //                                       DateFormat.yMMMd()
// //                                           .add_jm()
// //                                           .format(dateTime!),
// //                                       style: const TextStyle(
// //                                         color: Colors.grey,
// //                                         fontSize: 12,
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ],
// //                             ),
// //                             leading: RoundCheckbox(
// //                               value: data['isCompleted'] ?? false,
// //                               onChanged: (value) {},
// //                               // onChanged: (value) {
// //                               //   FirebaseService()
// //                               //       .updateTaskCompletion(
// //                               //       doc.id,
// //                               //       value ?? false);
// //                               // },
// //                             ),
// //                           );
// //                         },
// //                       );
// //                     } else {
// //                       return const CircularProgressIndicator();
// //                     }
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //
// //       default:
// //         return SizedBox.shrink();
// //     }
// //   }
// //
// //   int _getTaskTabNumber(String text) {
// //     switch (text) {
// //       case "Today":
// //         return 1;
// //       case "Next":
// //         return 2;
// //       case "Overdue":
// //         return 3;
// //       case "Done":
// //         return 4;
// //       default:
// //         return 1;
// //     }
// //   }
// //
// //   bool isSameDay(DateTime date1, DateTime date2) {
// //     return date1.year == date2.year &&
// //         date1.month == date2.month &&
// //         date1.day == date2.day;
// //   }
// //
// //   //meeting
// //   Widget _buildMeetingTabContainer(String text) {
// //     return GestureDetector(
// //       onTap: () {
// //         setState(() {
// //           switch (text) {
// //             case "Today":
// //               _currentMeetingTab = 1;
// //               break;
// //             case "Next":
// //               _currentMeetingTab = 2;
// //               break;
// //             case "Overdue":
// //               _currentMeetingTab = 3;
// //               break;
// //             case "Done":
// //               _currentMeetingTab = 4;
// //               break;
// //           }
// //         });
// //       },
// //       child: Container(
// //         width: 75,
// //         height: 35,
// //         decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(10),
// //             color: _currentMeetingTab == _getMeetingTabNumber(text)
// //                 ? Theme.of(context).primaryColor.withOpacity(0.2)
// //                 : Theme.of(context).primaryColor.withOpacity(0.1)),
// //         child: Center(
// //           child: Text(
// //             text,
// //             style: GoogleFonts.inter(
// //               textStyle: TextStyle(
// //                 color: _currentMeetingTab == _getMeetingTabNumber(text)
// //                     ? Theme.of(context).primaryColor
// //                     : Colors.black,
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildMeetingTabContent() {
// //     switch (_currentMeetingTab) {
// //       case 1:
// //         return SizedBox(
// //           width: MediaQuery.of(context).size.width,
// //           child: SingleChildScrollView(
// //             child: Column(
// //               children: [
// //                 StreamBuilder<QuerySnapshot>(
// //                   stream: FirebaseFirestore.instance
// //                       .collection('meetings')
// //                       .where('isCompleted', isEqualTo: false)
// //                       .snapshots(),
// //                   builder: (context, snapshot) {
// //                     if (snapshot.hasData) {
// //                       List<DocumentSnapshot> meetings = snapshot.data!.docs;
// //                       List<DocumentSnapshot> todayMeetings =
// //                           meetings.where((meeting) {
// //                         DateTime? meetingDate =
// //                             meeting['meetingDate']?.toDate();
// //                         return meetingDate != null &&
// //                             isSameDay(meetingDate, DateTime.now());
// //                       }).toList();
// //
// //                       return ListView.builder(
// //                         shrinkWrap: true,
// //                         physics: const NeverScrollableScrollPhysics(),
// //                         itemCount: todayMeetings.length,
// //                         itemBuilder: (context, index) {
// //                           final doc = todayMeetings[index];
// //                           Map<String, dynamic> data =
// //                               doc.data() as Map<String, dynamic>;
// //                           DateTime? dateTime;
// //                           if (data['meetingDate'] != null) {
// //                             dateTime = data['meetingDate'].toDate();
// //                           }
// //                           return ListTile(
// //                             title: Text(data['meetingSubject']),
// //                             subtitle: Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 Text(
// //                                   data['meetingDescription'],
// //                                   style: const TextStyle(
// //                                     fontSize: 13,
// //                                     color: Colors.grey,
// //                                   ),
// //                                 ),
// //                                 Row(
// //                                   children: [
// //                                     const Icon(
// //                                       Icons.calendar_today_outlined,
// //                                       size: 14,
// //                                       color: Colors.grey,
// //                                     ),
// //                                     const SizedBox(width: 4),
// //                                     Text(
// //                                       DateFormat.yMMMd()
// //                                           .add_jm()
// //                                           .format(dateTime!),
// //                                       style: const TextStyle(
// //                                         color: Colors.grey,
// //                                         fontSize: 12,
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ],
// //                             ),
// //                             leading: RoundCheckbox(
// //                               value: data['isCompleted'] ?? false,
// //                               onChanged: (value) {
// //                                 FirebaseService().updateMeetingCompletion(
// //                                     doc.id, value ?? false);
// //                               },
// //                             ),
// //                             onTap: () {
// //                               // Add any onTap behavior here
// //                             },
// //                           );
// //                         },
// //                       );
// //                     } else {
// //                       return const CircularProgressIndicator();
// //                     }
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //
// //       case 2:
// //         return SizedBox(
// //           width: MediaQuery.of(context).size.width,
// //           child: SingleChildScrollView(
// //             child: Column(
// //               children: [
// //                 StreamBuilder<QuerySnapshot>(
// //                   stream: FirebaseFirestore.instance
// //                       .collection('meetings')
// //                       .where('isCompleted', isEqualTo: false)
// //                       .snapshots(),
// //                   builder: (context, snapshot) {
// //                     if (snapshot.hasData) {
// //                       List<DocumentSnapshot> meetings = snapshot.data!.docs;
// //                       List<DocumentSnapshot> nextDayMeetings =
// //                           meetings.where((meeting) {
// //                         DateTime? meetingDate =
// //                             meeting['meetingDate']?.toDate();
// //                         return meetingDate != null &&
// //                             meetingDate.isAfter(DateTime.now()) &&
// //                             !isSameDay(meetingDate, DateTime.now());
// //                       }).toList();
// //
// //                       return ListView.builder(
// //                         shrinkWrap: true,
// //                         physics: const NeverScrollableScrollPhysics(),
// //                         itemCount: nextDayMeetings.length,
// //                         itemBuilder: (context, index) {
// //                           final doc = nextDayMeetings[index];
// //                           Map<String, dynamic> data =
// //                               doc.data() as Map<String, dynamic>;
// //                           DateTime? dateTime;
// //                           if (data['meetingDate'] != null) {
// //                             dateTime = data['meetingDate'].toDate();
// //                           }
// //                           return ListTile(
// //                             title: Text(data['meetingSubject']),
// //                             subtitle: Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 Text(
// //                                   data['meetingDescription'],
// //                                   style: const TextStyle(
// //                                     fontSize: 13,
// //                                     color: Colors.grey,
// //                                   ),
// //                                 ),
// //                                 Row(
// //                                   children: [
// //                                     const Icon(
// //                                       Icons.calendar_today_outlined,
// //                                       size: 14,
// //                                       color: Colors.grey,
// //                                     ),
// //                                     const SizedBox(width: 4),
// //                                     Text(
// //                                       DateFormat.yMMMd()
// //                                           .add_jm()
// //                                           .format(dateTime!),
// //                                       style: const TextStyle(
// //                                         color: Colors.grey,
// //                                         fontSize: 12,
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ],
// //                             ),
// //                             leading: RoundCheckbox(
// //                               value: data['isCompleted'] ?? false,
// //                               onChanged: (value) {
// //                                 FirebaseService().updateMeetingCompletion(
// //                                     doc.id, value ?? false);
// //                               },
// //                             ),
// //                             onTap: () {
// //                               // Add any onTap behavior here
// //                             },
// //                           );
// //                         },
// //                       );
// //                     } else {
// //                       return const CircularProgressIndicator();
// //                     }
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //
// //       case 3:
// //         return SizedBox(
// //           width: MediaQuery.of(context).size.width,
// //           child: SingleChildScrollView(
// //             child: Column(
// //               children: [
// //                 StreamBuilder<QuerySnapshot>(
// //                   stream: FirebaseFirestore.instance
// //                       .collection('meetings')
// //                       .where('isCompleted', isEqualTo: false)
// //                       .snapshots(),
// //                   builder: (context, snapshot) {
// //                     if (snapshot.hasData) {
// //                       List<DocumentSnapshot> meetings = snapshot.data!.docs;
// //                       List<DocumentSnapshot> overdueMeetings =
// //                           meetings.where((meeting) {
// //                         DateTime? meetingDate =
// //                             meeting['meetingDate']?.toDate();
// //                         return meetingDate != null &&
// //                             meetingDate.isBefore(DateTime.now()) &&
// //                             !isSameDay(meetingDate, DateTime.now());
// //                       }).toList();
// //
// //                       return ListView.builder(
// //                         shrinkWrap: true,
// //                         physics: const NeverScrollableScrollPhysics(),
// //                         itemCount: overdueMeetings.length,
// //                         itemBuilder: (context, index) {
// //                           final doc = overdueMeetings[index];
// //                           Map<String, dynamic> data =
// //                               doc.data() as Map<String, dynamic>;
// //                           DateTime? dateTime;
// //                           if (data['meetingDate'] != null) {
// //                             dateTime = data['meetingDate'].toDate();
// //                           }
// //                           return ListTile(
// //                             title: Text(data['meetingSubject']),
// //                             subtitle: Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 Text(
// //                                   data['meetingDescription'],
// //                                   style: const TextStyle(
// //                                     fontSize: 13,
// //                                     color: Colors.grey,
// //                                   ),
// //                                 ),
// //                                 Row(
// //                                   children: [
// //                                     const Icon(
// //                                       Icons.calendar_today_outlined,
// //                                       size: 14,
// //                                       color: Colors.grey,
// //                                     ),
// //                                     const SizedBox(width: 4),
// //                                     Text(
// //                                       DateFormat.yMMMd()
// //                                           .add_jm()
// //                                           .format(dateTime!),
// //                                       style: const TextStyle(
// //                                         color: Colors.grey,
// //                                         fontSize: 12,
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ],
// //                             ),
// //                             leading: RoundCheckbox(
// //                               value: data['isCompleted'] ?? false,
// //                               onChanged: (value) {
// //                                 FirebaseService().updateMeetingCompletion(
// //                                     doc.id, value ?? false);
// //                               },
// //                             ),
// //                             onTap: () {
// //                               // Add any onTap behavior here
// //                             },
// //                           );
// //                         },
// //                       );
// //                     } else {
// //                       return const CircularProgressIndicator();
// //                     }
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //
// //       case 4:
// //         return SizedBox(
// //           width: MediaQuery.of(context).size.width,
// //           child: SingleChildScrollView(
// //             child: Column(
// //               children: [
// //                 StreamBuilder<QuerySnapshot>(
// //                   stream: FirebaseFirestore.instance
// //                       .collection('meetings')
// //                       .where('isCompleted', isEqualTo: true)
// //                       .snapshots(),
// //                   builder: (context, snapshot) {
// //                     if (snapshot.hasData) {
// //                       List<DocumentSnapshot> meetings = snapshot.data!.docs;
// //                       return ListView.builder(
// //                         shrinkWrap: true,
// //                         physics: const NeverScrollableScrollPhysics(),
// //                         itemCount: meetings.length,
// //                         itemBuilder: (context, index) {
// //                           final doc = meetings[index];
// //                           Map<String, dynamic> data =
// //                               doc.data() as Map<String, dynamic>;
// //                           DateTime? dateTime;
// //                           if (data['meetingDate'] != null) {
// //                             dateTime = data['meetingDate'].toDate();
// //                           }
// //                           return ListTile(
// //                             title: Text(data['meetingSubject']),
// //                             subtitle: Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 Text(
// //                                   data['meetingDescription'],
// //                                   style: const TextStyle(
// //                                     fontSize: 13,
// //                                     color: Colors.grey,
// //                                   ),
// //                                 ),
// //                                 Row(
// //                                   children: [
// //                                     const Icon(
// //                                       Icons.calendar_today_outlined,
// //                                       size: 14,
// //                                       color: Colors.grey,
// //                                     ),
// //                                     const SizedBox(width: 4),
// //                                     Text(
// //                                       DateFormat.yMMMd()
// //                                           .add_jm()
// //                                           .format(dateTime!),
// //                                       style: const TextStyle(
// //                                         color: Colors.grey,
// //                                         fontSize: 12,
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ],
// //                             ),
// //                             leading: RoundCheckbox(
// //                               value: data['isCompleted'] ?? false,
// //                               onChanged: (value) {},
// //                             ),
// //                           );
// //                         },
// //                       );
// //                     } else {
// //                       return const CircularProgressIndicator();
// //                     }
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //
// //       default:
// //         // return SizedBox.shrink();
// //         return Container(
// //           color: Colors.green,
// //           child: Column(
// //             children: [
// //               Container(
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(10),
// //                   color: Colors.yellow,
// //                 ),
// //               ),
// //               Container(
// //                 child: Row(children: [
// //                   Text(
// //                     "No ‘Tasks’ Currently Assigned",
// //                   ),
// //                   Text(
// //                     "To add a task, please click the button below.",
// //                   ),
// //                 ]),
// //               ),
// //             ],
// //           ),
// //         );
// //     }
// //   }
// //
// //   int _getMeetingTabNumber(String text) {
// //     switch (text) {
// //       case "Today":
// //         return 1;
// //       case "Next":
// //         return 2;
// //       case "Overdue":
// //         return 3;
// //       case "Done":
// //         return 4;
// //       default:
// //         return 5;
// //     }
// //   }
// // }
// //
// // class RoundCheckbox extends StatelessWidget {
// //   final bool value;
// //   final ValueChanged<bool?> onChanged;
// //
// //   const RoundCheckbox(
// //       {super.key, required this.value, required this.onChanged});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: () {
// //         onChanged(!value);
// //       },
// //       child: Container(
// //         width: 24.0,
// //         height: 24.0,
// //         decoration: BoxDecoration(
// //           shape: BoxShape.circle,
// //           border: Border.all(
// //             color: Colors.black,
// //           ),
// //         ),
// //         child: Center(
// //           child: value
// //               ? const Icon(
// //                   Icons.radio_button_checked,
// //                   size: 22.0,
// //                   color: Colors.black,
// //                 )
// //               : Container(),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return DefaultTabController(
// //       length: 4,
// //       child: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Task Categorization'),
// //           bottom: TabBar(
// //             tabs: [
// //               Tab(text: 'Today'),
// //               Tab(text: 'Next Day'),
// //               Tab(text: 'Overdue'),
// //               Tab(text: 'Done'),
// //             ],
// //           ),
// //         ),
// //         body: TabBarView(
// //           children: [
// //             TaskCategoryView(category: TaskCategory.Today),
// //             TaskCategoryView(category: TaskCategory.NextDay),
// //             TaskCategoryView(category: TaskCategory.Overdue),
// //             TaskCategoryView(category: TaskCategory.Done),
// //           ],
// //         ),
// //         floatingActionButton: FloatingActionButton(
// //           onPressed: () {
// //             // Handle adding tasks here
// //             // For example, navigate to a new screen for adding tasks
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(builder: (context) => AddTask()),
// //             );
// //           },
// //           child: Icon(Icons.add),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:solosync/screens/addmeeting.dart';
// import 'package:solosync/screens/addtask.dart';
// import 'package:solosync/screens/meetingdetails.dart';
// import 'package:solosync/screens/taskdetails.dart';
// import 'package:solosync/services/tasksandmeetings.dart';
//
// enum TaskCategory {
//   Today,
//   Upcoming,
//   Overdue,
//   Done,
// }
// enum MeetingCategory {
//   Today,
//   Upcoming,
//   Overdue,
//   Done,
// }
//
//
// class Task {
//   final String description;
//   final DateTime dueDate;
//   final bool isDone;
//
//   Task({
//     required this.description,
//     required this.dueDate,
//     this.isDone = false,
//   });
// }
//
// class Meeting {
//   final DateTime date;
//   final String description;
//   final bool isCompleted;
//
//   Meeting({
//     required this.date,
//     required this.description,
//     this.isCompleted = false,
//   });
// }
//
//
//
// class HomePage extends StatefulWidget {
//   final GlobalKey<ScaffoldState> scaffoldKey;
//
//   const HomePage({Key? key, required this.scaffoldKey}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState(scaffoldKey: scaffoldKey);
// }
//
// class _HomePageState extends State<HomePage> {
//   final GlobalKey<ScaffoldState> scaffoldKey;
//
//   _HomePageState({required this.scaffoldKey});
//
//   int _currentTaskTab = 0;
//   int _currentMeetingTab = 0;
//   bool _expandTasks = false;
//   bool _expandMeetings = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           Container(
//             color: Theme.of(context).primaryColor,
//           ),
//           Positioned(
//             top: 60,
//             left: 3,
//             child: Container(
//               width: 50,
//               height: 50,
//               child: IconButton(
//                 onPressed: () {
//                   scaffoldKey.currentState!.openDrawer();
//                 },
//                 icon: const Icon(Icons.menu_rounded, color: Colors.white, size: 30),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 110,
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: Container(
//               height: MediaQuery.of(context).size.height,
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20.0),
//                   topRight: Radius.circular(20.0),
//                 ),
//                 color: Colors.white,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//                 child: ListView(
//                   children: [
//                     Card(
//                       color: Colors.white,
//                       elevation: 4,
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text('  Tasks',
//                                     style: GoogleFonts.inter(
//                                       textStyle: const TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold),
//                                     )),
//                                 GestureDetector(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => const AddTask()),
//                                     );
//                                   },
//                                   child: Container(
//                                     height: 25,
//                                     width: 30,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.horizontal(
//                                         left: Radius.circular(10.0),
//                                         right: Radius.circular(10.0),
//                                       ),
//                                       color:Theme.of(context).primaryColor,
//                                     ),
//
//                                     child: const Icon(
//                                       Icons.add,
//                                       size: 18,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 20),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 _buildTaskTabContainer("Today", 0),
//                                 _buildTaskTabContainer("Upcoming", 1),
//                                 _buildTaskTabContainer("Overdue", 2),
//                                 _buildTaskTabContainer("Done", 3),
//                               ],
//                             ),
//
//                             Container(
//                               child: TaskCategoryView(category: TaskCategory.values[_currentTaskTab]),
//                             ),
//                             if (!_expandTasks && _currentTaskTab != 3)
//                             SizedBox(
//                               height: 10,
//                             ),
//
//                             GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   _expandTasks = !_expandTasks;
//                                 });
//                               },
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//
//                                     Text(_expandTasks ? 'See less   ' : 'See all   ',
//                                     style: GoogleFonts.inter(
//                                         textStyle: TextStyle(
//                                             fontSize: 12,
//                                             color: Theme.of(context).primaryColor)),)
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Card(
//                       color: Colors.white,
//                       elevation: 4,
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text('  Meetings',
//                                     style: GoogleFonts.inter(
//                                       textStyle: const TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold),
//                                     )),
//                                 GestureDetector(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => const AddMeeting()),
//                                     );
//                                   },
//                                   child: Container(
//                                     height: 25,
//                                     width: 30,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.horizontal(
//                                         left: Radius.circular(10.0),
//                                         right: Radius.circular(10.0),
//                                       ),
//                                       color:Theme.of(context).primaryColor,
//                                     ),
//
//                                     child: const Icon(
//                                       Icons.add,
//                                       size: 18,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 20),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 _buildMeetingTabContainer("Today", 0),
//                                 _buildMeetingTabContainer("Upcoming", 1),
//                                 _buildMeetingTabContainer("Overdue", 2),
//                                 _buildMeetingTabContainer("Done", 3),
//                               ],
//                             ),
//                             Container(
//                               child: MeetingCategoryView(category: MeetingCategory.values[_currentMeetingTab]),
//                             ),
//                             if (!_expandMeetings && _currentMeetingTab != 3)
//                             const SizedBox(height: 10),
//                             GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   _expandMeetings = !_expandMeetings;
//                                 });
//                               },
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//
//                                   Text(_expandMeetings ? 'See less   ' : 'See all   ',
//                                     style: GoogleFonts.inter(
//                                         textStyle: TextStyle(
//                                             fontSize: 12,
//                                             color: Theme.of(context).primaryColor)),)
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//
//   Widget _buildTaskTabContainer(String label, int index) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _currentTaskTab = index;
//           _expandTasks = true; // Set expandTasks to true when tab is clicked
//         });
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//         decoration: BoxDecoration(
//           color: _currentTaskTab == index ? Theme.of(context).primaryColor : Colors.transparent,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Text(
//           label,
//           style: TextStyle(
//             color: _currentTaskTab == index ? Colors.white : Colors.black,
//             fontWeight: _currentTaskTab == index ? FontWeight.bold : FontWeight.normal,
//           ),
//         ),
//       ),
//     );
//   }
//
//
//
//   Widget _buildMeetingTabContainer(String label, int index) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _currentMeetingTab = index;
//         });
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//         decoration: BoxDecoration(
//           color: _currentMeetingTab == index ? Theme.of(context).primaryColor : Colors.transparent,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Text(
//           label,
//           style: TextStyle(
//             color: _currentMeetingTab == index ? Colors.white : Colors.black,
//             fontWeight: _currentMeetingTab == index ? FontWeight.bold : FontWeight.normal,
//           ),
//         ),
//       ),
//     );
//   }
//
// }
//
//
// class TaskCategoryView extends StatelessWidget {
//   final TaskCategory category;
//
//   TaskCategoryView({required this.category});
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseFirestore.instance
//           .collection('tasks')
//           .snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           List<DocumentSnapshot> tasks = snapshot.data!.docs;
//           DateTime now = DateTime.now();
//           DateTime nextDay = now.add(Duration(days: 1));
//
//           List<DocumentSnapshot> filteredTasks = tasks.where((task) {
//             DateTime? taskDate = task['taskDate']?.toDate();
//             bool isCompleted = task['isCompleted'] ?? false;
//
//             switch (category) {
//               case TaskCategory.Today:
//                 return isSameDay(taskDate ?? now, now) && !isCompleted;
//               case TaskCategory.Upcoming:
//                 return taskDate != null && taskDate.isAfter(nextDay) &&
//                     !isCompleted;
//               case TaskCategory.Overdue:
//                 return taskDate != null && taskDate.isBefore(now) &&
//                     !isCompleted;
//               case TaskCategory.Done:
//                 return isCompleted;
//               default:
//                 return false;
//             }
//           }).toList();
//
//           List<DocumentSnapshot> displayedTasks = _expandTasks
//               ? filteredTasks
//               : filteredTasks.take(3).toList();
//
//           return Column(
//             children: [
//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: displayedTasks.length,
//                 itemBuilder: (context, index) {
//                   final doc = displayedTasks[index];
//                   Map<String, dynamic> data = doc.data() as Map<String,
//                       dynamic>;
//
//                   return ListTile(
//                     title: Text(data['taskDescription']),
//                     // Updated field name here
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Due Date: ${DateFormat.yMMMd().add_jm().format(
//                               data['taskDate']?.toDate() ?? DateTime.now())}',
//                           // Updated field name here
//                           style: const TextStyle(
//                             fontSize: 13,
//                             color: Colors.grey,
//                           ),
//                         ),
//                         if (category == TaskCategory.Overdue)
//                           Text(
//                             'Overdue: ${DateFormat.yMMMd().add_jm().format(
//                                 data['taskDate']?.toDate() ?? DateTime.now())}',
//                             // Updated field name here
//                             style: const TextStyle(
//                               fontSize: 13,
//                               color: Colors.red,
//                             ),
//                           ),
//                       ],
//                     ),
//                     leading: RoundCheckbox(
//                       value: data['isCompleted'] ?? false,
//                       // Updated field name here
//                       onChanged: (value) {
//                         FirebaseService().updateTaskCompletion(
//                             doc.id,
//                             value ?? false
//                         );
//                       },
//                     ),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => TaskDetails()),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ],
//           );
//         } else {
//           return const CircularProgressIndicator();
//         }
//       },
//     );
//   }
// }
//
//
//   class MeetingCategoryView extends StatelessWidget {
//   final MeetingCategory category;
//
//   MeetingCategoryView({required this.category});
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder      <QuerySnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection('meetings')
//           .snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           List<DocumentSnapshot> meetings = snapshot.data!.docs;
//           DateTime now = DateTime.now();
//           DateTime nextDay = now.add(Duration(days: 1));
//
//           List<DocumentSnapshot> filteredMeetings = meetings.where((meeting) {
//             DateTime? meetingDate = meeting['meetingDate']?.toDate();
//             bool isCompleted = meeting['isCompleted'] ?? false;
//
//             switch (category) {
//               case MeetingCategory.Today:
//                 return isSameDay(meetingDate ?? now, now) && !isCompleted;
//               case MeetingCategory.Upcoming:
//                 return meetingDate != null && meetingDate.isAfter(nextDay) && !isCompleted;
//               case MeetingCategory.Overdue:
//                 return meetingDate != null && meetingDate.isBefore(now) && !isCompleted;
//               case MeetingCategory.Done:
//                 return isCompleted;
//               default:
//                 return false;
//             }
//           }).toList();
//
//           return ListView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: filteredMeetings.length,
//             itemBuilder: (context, index) {
//               final doc = filteredMeetings[index];
//               Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//
//               return ListTile(
//                 title: Text(data['meetingDescription']),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Meeting Date: ${DateFormat.yMMMd().add_jm().format(data['meetingDate']?.toDate() ?? DateTime.now())}',
//                       style: const TextStyle(
//                         fontSize: 13,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     if (category == MeetingCategory.Overdue)
//                       Text(
//                         'Overdue: ${DateFormat.yMMMd().add_jm().format(data['meetingDate']?.toDate() ?? DateTime.now())}',
//                         style: const TextStyle(
//                           fontSize: 13,
//                           color: Colors.red,
//                         ),
//                       ),
//                   ],
//                 ),
//                 leading: RoundCheckbox(
//                   value: data['isCompleted'] ?? false,
//                   onChanged: (value) {
//                     FirebaseService().updateMeetingCompletion(
//                         doc.id,
//                         value ?? false
//                     );
//                   },
//                 ),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => MeetingDetails()),
//                   );
//                 },
//               );
//             },
//           );
//         } else {
//           return const CircularProgressIndicator();
//         }
//       },
//     );
//   }
// }
//
// // Custom RoundCheckbox widget
// class RoundCheckbox extends StatelessWidget {
//   final bool value;
//   final ValueChanged<bool?> onChanged;
//
//   RoundCheckbox({required this.value, required this.onChanged});
//
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       value: value,
//       onChanged: onChanged,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(30.0),
//       ),
//       // Add custom styling if needed
//     );
//   }
// }
//
// // Utility function for date comparison
// bool isSameDay(DateTime date1, DateTime date2) {
//   return date1.year == date2.year &&
//       date1.month == date2.month &&
//       date1.day == date2.day;
// }
//
//
//


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:solosync/screens/notificationpage.dart';

import '../../services/tasksandmeetings.dart';
import '../addmeeting.dart';
import '../addtask.dart';
import '../meetingdetails.dart';
import '../taskdetails.dart';

enum TaskCategory {
  Today,
  Upcoming,
  Overdue,
  Done,
}

enum MeetingCategory {
  Today,
  Upcoming,
  Overdue,
  Done,
}

class HomePage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HomePage({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(scaffoldKey: scaffoldKey);
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey;
  bool _expandTasks = false;
  bool _expandMeetings = false;
  int _currentTaskTab = 0;
  int _currentMeetingTab = 0;

  _HomePageState({required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Theme.of(context).primaryColor,
          ),
          Positioned(
            top: 60,
            left: 0,
            child: Container(
              width: 50,
              height: 50,
              child: IconButton(
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
                icon: const Icon(Icons.menu_rounded, color: Colors.white, size: 26),
              ),
            ),
          ),
          Positioned(
            top: 60,
            right: 0,
            child: Container(
              width: 50,
              height: 50,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationPage()),
                  );
                },
                icon: const Icon(Icons.notifications_none, color: Colors.white, size: 24),
              ),
            ),
          ),
          Positioned(
            top: 110,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: ListView(
                  children: [
                    Card(
                      color: Colors.white,
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('  Tasks',
                                    style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const AddTask()),
                                    );
                                  },
                                  child: Container(
                                    height: 25,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(10.0),
                                        right: Radius.circular(10.0),
                                      ),
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildTabContainer("Today", 0, TaskCategory.Today),
                                _buildTabContainer("Upcoming", 1, TaskCategory.Upcoming),
                                _buildTabContainer("Overdue", 2, TaskCategory.Overdue),
                                _buildTabContainer("Done", 3, TaskCategory.Done),
                              ],
                            ),
                            _buildCategoryView(TaskCategory.values[_currentTaskTab]),
                            if (!_expandTasks && _currentTaskTab != 3) const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _expandTasks = !_expandTasks;
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _expandTasks ? 'See less   ' : 'See all   ',
                                    style: GoogleFonts.inter(
                                        textStyle:  TextStyle(
                                            fontSize: 12,
                                            color: Theme.of(context).primaryColor)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Card(
                      color: Colors.white,
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('  Meetings',
                                    style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const AddMeeting()),
                                    );
                                  },
                                  child: Container(
                                    height: 25,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(10.0),
                                        right: Radius.circular(10.0),
                                      ),
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildTabContainer("Today", 0, MeetingCategory.Today),
                                _buildTabContainer("Upcoming", 1, MeetingCategory.Upcoming),
                                _buildTabContainer("Overdue", 2, MeetingCategory.Overdue),
                                _buildTabContainer("Done", 3, MeetingCategory.Done),
                              ],
                            ),
                            _buildCategoryView(MeetingCategory.values[_currentMeetingTab]),
                            if (!_expandMeetings && _currentMeetingTab != 3) const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _expandMeetings = !_expandMeetings;
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _expandMeetings ? 'See less   ' : 'See all   ',
                                    style: GoogleFonts.inter(
                                        textStyle:  TextStyle(
                                            fontSize: 12,
                                            color: Theme.of(context).primaryColor)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContainer(String label, int index, dynamic category) {
    return GestureDetector(
      onTap: () {
        if (category is TaskCategory) {
          setState(() {
            _currentTaskTab = index;
          });
        } else if (category is MeetingCategory) {
          setState(() {
            _currentMeetingTab = index;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: (category is TaskCategory && _currentTaskTab == index) ||
              (category is MeetingCategory && _currentMeetingTab == index)
              ? Theme.of(context).primaryColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: (category is TaskCategory && _currentTaskTab == index) ||
                (category is MeetingCategory && _currentMeetingTab == index)
                ? Colors.white
                : Colors.black,
            fontWeight: (category is TaskCategory && _currentTaskTab == index) ||
                (category is MeetingCategory && _currentMeetingTab == index)
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryView(dynamic category) {
    if (category is TaskCategory) {
      return TaskCategoryView(category: category, expandTasks: _expandTasks);
    } else if (category is MeetingCategory) {
      return MeetingCategoryView(category: category, expandMeetings: _expandMeetings);
    } else {
      return SizedBox.shrink();
    }
  }
}

class TaskCategoryView extends StatelessWidget {
  final TaskCategory category;
  final bool expandTasks;

  TaskCategoryView({required this.category, required this.expandTasks});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('tasks').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<DocumentSnapshot> tasks = snapshot.data!.docs;
          DateTime now = DateTime.now();
          DateTime nextDay = now.add(Duration(days: 1));

          List<DocumentSnapshot> filteredTasks = tasks.where((task) {
            DateTime? taskDate = task['taskDate']?.toDate();
            bool isCompleted = task['isCompleted'] ?? false;

            switch (category) {
              case TaskCategory.Today:
                return isSameDay(taskDate ?? now, now) && !isCompleted;
              case TaskCategory.Upcoming:
                return taskDate != null && taskDate.isAfter(nextDay) && !isCompleted;
              case TaskCategory.Overdue:
                return taskDate != null && taskDate.isBefore(now) && !isCompleted;
              case TaskCategory.Done:
                return isCompleted;
              default:
                return false;
            }
          }).toList();

          if (filteredTasks.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.asset('assets/icons/tasks.png'),
                        width: 45,
                        height: 45,
                      ),
                      SizedBox(width: 20,),
                      Column(
                        children: [
                          Text(
                            'No Tasks Assigned.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'To add a task, please \n click the Add Task button',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          List<DocumentSnapshot> displayedTasks = expandTasks ? filteredTasks : filteredTasks.take(3).toList();

          return Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: displayedTasks.length,
                itemBuilder: (context, index) {
                  final doc = displayedTasks[index];
                  Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

                  return ListTile(
                    title: Text(data['taskDescription']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Due Date: ${DateFormat.yMMMd().add_jm().format(data['taskDate']?.toDate() ?? DateTime.now())}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                        if (category == TaskCategory.Overdue)
                          Text(
                            'Overdue: ${DateFormat.yMMMd().add_jm().format(data['taskDate']?.toDate() ?? DateTime.now())}',
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.red,
                            ),
                          ),
                      ],
                    ),
                    leading: RoundCheckbox(
                      value: data['isCompleted'] ?? false,
                      onChanged: (value) {
                        FirebaseService().updateTaskCompletion(
                          doc.id,
                          value ?? false,
                        );
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TaskDetails()),
                      );
                    },
                  );
                },
              ),
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}


class MeetingCategoryView extends StatelessWidget {
  final MeetingCategory category;
  final bool expandMeetings;

  MeetingCategoryView({required this.category, required this.expandMeetings});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('meetings').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<DocumentSnapshot> meetings = snapshot.data!.docs;
          DateTime now = DateTime.now();
          DateTime nextDay = now.add(Duration(days: 1));

          List<DocumentSnapshot> filteredMeetings = meetings.where((meeting) {
            DateTime? meetingDate = meeting['meetingDate']?.toDate();
            bool isCompleted = meeting['isCompleted'] ?? false;

            switch (category) {
              case MeetingCategory.Today:
                return isSameDay(meetingDate ?? now, now) && !isCompleted;
              case MeetingCategory.Upcoming:
                return meetingDate != null && meetingDate.isAfter(nextDay) && !isCompleted;
              case MeetingCategory.Overdue:
                return meetingDate != null && meetingDate.isBefore(now) && !isCompleted;
              case MeetingCategory.Done:
                return isCompleted;
              default:
                return false;
            }
          }).toList();


          if (filteredMeetings.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.asset('assets/icons/meetings.png'),
                        width: 45,
                        height: 45,
                      ),
                      SizedBox(width: 20,),
                      Column(
                        children: [
                          Text(
                            'No Meetings Assigned.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'To add a meeting, please \n click the Add Meeting button',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }


          List<DocumentSnapshot> displayedMeetings = expandMeetings ? filteredMeetings : filteredMeetings.take(3).toList();

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: displayedMeetings.length,
            itemBuilder: (context, index) {
              final doc = displayedMeetings[index];
              Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

              return ListTile(
                title: Text(data['meetingDescription']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Meeting Date: ${DateFormat.yMMMd().add_jm().format(data['meetingDate']?.toDate() ?? DateTime.now())}',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                    if (category == MeetingCategory.Overdue)
                      Text(
                        'Overdue: ${DateFormat.yMMMd().add_jm().format(data['meetingDate']?.toDate() ?? DateTime.now())}',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.red,
                        ),
                      ),
                  ],
                ),
                leading: RoundCheckbox(
                  value: data['isCompleted'] ?? false,
                  onChanged: (value) {
                    FirebaseService().updateMeetingCompletion(
                      doc.id,
                      value ?? false,
                    );
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MeetingDetails()),
                  );
                },
              );
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class RoundCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  RoundCheckbox({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: onChanged,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}

bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
}




