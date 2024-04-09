import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:solosync/screens/addmeeting.dart';
import 'package:solosync/screens/addtask.dart';
import 'package:solosync/screens/taskdetails.dart';
import 'package:solosync/services/tasksandmeetings.dart';

class HomePage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HomePage({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState(scaffoldKey: scaffoldKey);
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey;

  _HomePageState({required this.scaffoldKey});
  int _currentTaskTab = 1;
  int _currentMeetingTab = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(alignment: Alignment.center, children: [
      Container(
        color: Theme.of(context).primaryColor,
      ),
      Positioned(
        top: 60,
        left: 3,
        child: Container(
          width: 50,
          height: 50,
          child: IconButton(
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu_rounded, color: Colors.white, size: 30),
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
                              child: Text(
                                'See all   ',
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).primaryColor)),
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildTaskTabContainer("Today"),
                            _buildTaskTabContainer("Next"),
                            _buildTaskTabContainer("Overdue"),
                            _buildTaskTabContainer("Done"),
                          ],
                        ),
                        Container(
                          child: _buildTaskTabContent(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddTask()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.add,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Text('Create a Task',
                                  style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  )),
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
                            Text(
                              'See all   ',
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context).primaryColor)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildMeetingTabContainer("Today"),
                            _buildMeetingTabContainer("Next"),
                            _buildMeetingTabContainer("Overdue"),
                            _buildMeetingTabContainer("Done"),
                          ],
                        ),
                        Container(
                          child: _buildMeetingTabContent(),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddMeeting()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.add,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Text('Create a Meeting',
                                  style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  )),
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
    ]));
  }

  // task

  Widget _buildTaskTabContainer(String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          switch (text) {
            case "Today":
              _currentTaskTab = 1;
              break;
            case "Next":
              _currentTaskTab = 2;
              break;
            case "Overdue":
              _currentTaskTab = 3;
              break;
            case "Done":
              _currentTaskTab = 4;
              break;
          }
        });
      },
      child: Container(
        width: 75,
        height: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _currentTaskTab == _getTaskTabNumber(text)
                ? Theme.of(context).primaryColor.withOpacity(0.2)
                : Theme.of(context).primaryColor.withOpacity(0.1)),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                color: _currentTaskTab == _getTaskTabNumber(text)
                    ? Theme.of(context).primaryColor
                    : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTaskTabContent() {
    switch (_currentTaskTab) {
      case 1:
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('tasks')
                      .where('isCompleted', isEqualTo: false)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<DocumentSnapshot> tasks = snapshot.data!.docs;
                      List<DocumentSnapshot> todayTasks = tasks.where((task) {
                        DateTime? taskDate = task['taskDate']?.toDate();
                        return taskDate != null &&
                            isSameDay(taskDate, DateTime.now());
                      }).toList();

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: todayTasks.length,
                        itemBuilder: (context, index) {
                          final doc = todayTasks[index];
                          Map<String, dynamic> data =
                              doc.data() as Map<String, dynamic>;
                          DateTime? dateTime;
                          if (data['taskDate'] != null) {
                            dateTime = data['taskDate'].toDate();
                          }
                          return ListTile(
                            title: Text(data['taskSubject']),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['taskDescription'],
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today_outlined,
                                      size: 14,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      DateFormat.yMMMd()
                                          .add_jm()
                                          .format(dateTime!),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            leading: RoundCheckbox(
                              value: data['isCompleted'] ?? false,
                              onChanged: (value) {
                                FirebaseService().updateTaskCompletion(
                                    doc.id, value ?? false);
                              },
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TaskDetails()),
                              );
                            },
                          );
                        },
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        );

      case 2:
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('tasks')
                      .where('isCompleted', isEqualTo: false)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<DocumentSnapshot> tasks = snapshot.data!.docs;
                      List<DocumentSnapshot> nextDayTasks = tasks.where((task) {
                        DateTime? taskDate = task['taskDate']?.toDate();
                        return taskDate != null &&
                            taskDate.isAfter(DateTime.now()) &&
                            !isSameDay(taskDate, DateTime.now());
                      }).toList();

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: nextDayTasks.length,
                        itemBuilder: (context, index) {
                          final doc = nextDayTasks[index];
                          Map<String, dynamic> data =
                              doc.data() as Map<String, dynamic>;
                          DateTime? dateTime;
                          if (data['taskDate'] != null) {
                            dateTime = data['taskDate'].toDate();
                          }
                          return ListTile(
                            title: Text(data['taskSubject']),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['taskDescription'],
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today_outlined,
                                      size: 14,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      DateFormat.yMMMd()
                                          .add_jm()
                                          .format(dateTime!),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            leading: RoundCheckbox(
                              value: data['isCompleted'] ?? false,
                              onChanged: (value) {
                                FirebaseService().updateTaskCompletion(
                                    doc.id, value ?? false);
                              },
                            ),
                            onTap: () {
                              // Add any onTap behavior here
                            },
                          );
                        },
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        );

      case 3:
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('tasks')
                      .where('isCompleted', isEqualTo: false)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<DocumentSnapshot> tasks = snapshot.data!.docs;
                      List<DocumentSnapshot> overdueTasks = tasks.where((task) {
                        DateTime? taskDate = task['taskDate']?.toDate();
                        return taskDate != null &&
                            taskDate.isBefore(DateTime.now()) &&
                            !isSameDay(taskDate, DateTime.now());
                      }).toList();

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: overdueTasks.length,
                        itemBuilder: (context, index) {
                          final doc = overdueTasks[index];
                          Map<String, dynamic> data =
                              doc.data() as Map<String, dynamic>;
                          DateTime? dateTime;
                          if (data['taskDate'] != null) {
                            dateTime = data['taskDate'].toDate();
                          }
                          return ListTile(
                            title: Text(data['taskSubject']),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['taskDescription'],
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today_outlined,
                                      size: 14,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      DateFormat.yMMMd()
                                          .add_jm()
                                          .format(dateTime!),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            leading: RoundCheckbox(
                              value: data['isCompleted'] ?? false,
                              onChanged: (value) {
                                FirebaseService().updateTaskCompletion(
                                    doc.id, value ?? false);
                              },
                            ),
                            onTap: () {
                              // Add any onTap behavior here
                            },
                          );
                        },
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        );

      case 4:
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('tasks')
                      .where('isCompleted', isEqualTo: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<DocumentSnapshot> tasks = snapshot.data!.docs;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          final doc = tasks[index];
                          Map<String, dynamic> data =
                              doc.data() as Map<String, dynamic>;
                          DateTime? dateTime;
                          if (data['taskDate'] != null) {
                            dateTime = data['taskDate'].toDate();
                          }
                          return ListTile(
                            title: Text(data['taskSubject']),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['taskDescription'],
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today_outlined,
                                      size: 14,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      DateFormat.yMMMd()
                                          .add_jm()
                                          .format(dateTime!),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            leading: RoundCheckbox(
                              value: data['isCompleted'] ?? false,
                              onChanged: (value) {},
                              // onChanged: (value) {
                              //   FirebaseService()
                              //       .updateTaskCompletion(
                              //       doc.id,
                              //       value ?? false);
                              // },
                            ),
                          );
                        },
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        );

      default:
        return SizedBox.shrink();
    }
  }

  int _getTaskTabNumber(String text) {
    switch (text) {
      case "Today":
        return 1;
      case "Next":
        return 2;
      case "Overdue":
        return 3;
      case "Done":
        return 4;
      default:
        return 1;
    }
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  //meeting
  Widget _buildMeetingTabContainer(String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          switch (text) {
            case "Today":
              _currentMeetingTab = 1;
              break;
            case "Next":
              _currentMeetingTab = 2;
              break;
            case "Overdue":
              _currentMeetingTab = 3;
              break;
            case "Done":
              _currentMeetingTab = 4;
              break;
          }
        });
      },
      child: Container(
        width: 75,
        height: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _currentMeetingTab == _getMeetingTabNumber(text)
                ? Theme.of(context).primaryColor.withOpacity(0.2)
                : Theme.of(context).primaryColor.withOpacity(0.1)),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                color: _currentMeetingTab == _getMeetingTabNumber(text)
                    ? Theme.of(context).primaryColor
                    : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMeetingTabContent() {
    switch (_currentMeetingTab) {
      case 1:
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('meetings')
                      .where('isCompleted', isEqualTo: false)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<DocumentSnapshot> meetings = snapshot.data!.docs;
                      List<DocumentSnapshot> todayMeetings =
                          meetings.where((meeting) {
                        DateTime? meetingDate =
                            meeting['meetingDate']?.toDate();
                        return meetingDate != null &&
                            isSameDay(meetingDate, DateTime.now());
                      }).toList();

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: todayMeetings.length,
                        itemBuilder: (context, index) {
                          final doc = todayMeetings[index];
                          Map<String, dynamic> data =
                              doc.data() as Map<String, dynamic>;
                          DateTime? dateTime;
                          if (data['meetingDate'] != null) {
                            dateTime = data['meetingDate'].toDate();
                          }
                          return ListTile(
                            title: Text(data['meetingSubject']),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['meetingDescription'],
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today_outlined,
                                      size: 14,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      DateFormat.yMMMd()
                                          .add_jm()
                                          .format(dateTime!),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            leading: RoundCheckbox(
                              value: data['isCompleted'] ?? false,
                              onChanged: (value) {
                                FirebaseService().updateMeetingCompletion(
                                    doc.id, value ?? false);
                              },
                            ),
                            onTap: () {
                              // Add any onTap behavior here
                            },
                          );
                        },
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        );

      case 2:
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('meetings')
                      .where('isCompleted', isEqualTo: false)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<DocumentSnapshot> meetings = snapshot.data!.docs;
                      List<DocumentSnapshot> nextDayMeetings =
                          meetings.where((meeting) {
                        DateTime? meetingDate =
                            meeting['meetingDate']?.toDate();
                        return meetingDate != null &&
                            meetingDate.isAfter(DateTime.now()) &&
                            !isSameDay(meetingDate, DateTime.now());
                      }).toList();

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: nextDayMeetings.length,
                        itemBuilder: (context, index) {
                          final doc = nextDayMeetings[index];
                          Map<String, dynamic> data =
                              doc.data() as Map<String, dynamic>;
                          DateTime? dateTime;
                          if (data['meetingDate'] != null) {
                            dateTime = data['meetingDate'].toDate();
                          }
                          return ListTile(
                            title: Text(data['meetingSubject']),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['meetingDescription'],
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today_outlined,
                                      size: 14,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      DateFormat.yMMMd()
                                          .add_jm()
                                          .format(dateTime!),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            leading: RoundCheckbox(
                              value: data['isCompleted'] ?? false,
                              onChanged: (value) {
                                FirebaseService().updateMeetingCompletion(
                                    doc.id, value ?? false);
                              },
                            ),
                            onTap: () {
                              // Add any onTap behavior here
                            },
                          );
                        },
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        );

      case 3:
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('meetings')
                      .where('isCompleted', isEqualTo: false)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<DocumentSnapshot> meetings = snapshot.data!.docs;
                      List<DocumentSnapshot> overdueMeetings =
                          meetings.where((meeting) {
                        DateTime? meetingDate =
                            meeting['meetingDate']?.toDate();
                        return meetingDate != null &&
                            meetingDate.isBefore(DateTime.now()) &&
                            !isSameDay(meetingDate, DateTime.now());
                      }).toList();

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: overdueMeetings.length,
                        itemBuilder: (context, index) {
                          final doc = overdueMeetings[index];
                          Map<String, dynamic> data =
                              doc.data() as Map<String, dynamic>;
                          DateTime? dateTime;
                          if (data['meetingDate'] != null) {
                            dateTime = data['meetingDate'].toDate();
                          }
                          return ListTile(
                            title: Text(data['meetingSubject']),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['meetingDescription'],
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today_outlined,
                                      size: 14,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      DateFormat.yMMMd()
                                          .add_jm()
                                          .format(dateTime!),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            leading: RoundCheckbox(
                              value: data['isCompleted'] ?? false,
                              onChanged: (value) {
                                FirebaseService().updateMeetingCompletion(
                                    doc.id, value ?? false);
                              },
                            ),
                            onTap: () {
                              // Add any onTap behavior here
                            },
                          );
                        },
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        );

      case 4:
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('meetings')
                      .where('isCompleted', isEqualTo: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<DocumentSnapshot> meetings = snapshot.data!.docs;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: meetings.length,
                        itemBuilder: (context, index) {
                          final doc = meetings[index];
                          Map<String, dynamic> data =
                              doc.data() as Map<String, dynamic>;
                          DateTime? dateTime;
                          if (data['meetingDate'] != null) {
                            dateTime = data['meetingDate'].toDate();
                          }
                          return ListTile(
                            title: Text(data['meetingSubject']),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['meetingDescription'],
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today_outlined,
                                      size: 14,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      DateFormat.yMMMd()
                                          .add_jm()
                                          .format(dateTime!),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            leading: RoundCheckbox(
                              value: data['isCompleted'] ?? false,
                              onChanged: (value) {},
                            ),
                          );
                        },
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        );

      default:
        // return SizedBox.shrink();
        return Container(
          color: Colors.green,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.yellow,
                ),
              ),
              Container(
                child: Row(children: [
                  Text(
                    "No ‘Tasks’ Currently Assigned",
                  ),
                  Text(
                    "To add a task, please click the button below.",
                  ),
                ]),
              ),
            ],
          ),
        );
    }
  }

  int _getMeetingTabNumber(String text) {
    switch (text) {
      case "Today":
        return 1;
      case "Next":
        return 2;
      case "Overdue":
        return 3;
      case "Done":
        return 4;
      default:
        return 5;
    }
  }
}

class RoundCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const RoundCheckbox(
      {super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Center(
          child: value
              ? const Icon(
                  Icons.radio_button_checked,
                  size: 22.0,
                  color: Colors.black,
                )
              : Container(),
        ),
      ),
    );
  }
}
