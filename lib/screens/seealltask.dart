// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import 'addtask.dart';
// import 'drawer pages/homepage.dart';
// class SeeAllTask extends StatefulWidget {
//   const SeeAllTask({super.key});
//
//   @override
//   State<SeeAllTask> createState() => _SeeAllTaskState();
// }
//
// class _SeeAllTaskState extends State<SeeAllTask> {
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
//                   // scaffoldKey.currentState!.openDrawer();
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
//                                   child: Text(
//                                     'See all   ',
//                                     style: GoogleFonts.inter(
//                                         textStyle: TextStyle(
//                                             fontSize: 12,
//                                             color: Theme.of(context).primaryColor)),
//                                   ),
//                                   onTap: () {},
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 20),
//
//                             Container(
//                               child: TaskCategoryView(category: TaskCategory.values[_currentTaskTab]),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => const AddTask()),
//                                 );
//                               },
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Icon(
//                                     Icons.add,
//                                     size: 18,
//                                   ),
//                                   const SizedBox(width: 8),
//                                   Text('Create a Task',
//                                       style: GoogleFonts.inter(
//                                         textStyle: const TextStyle(
//                                             color: Colors.grey, fontSize: 14),
//                                       )),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//
//     );
//   }
//
//   Widget _buildTaskTabContainer(String label, int index) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _currentTaskTab = index;
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
//   class TaskCategoryView extends StatelessWidget {
//   final TaskCategory category;
//
//   TaskCategoryView({required this.category});
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection('tasks')
//           .snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           List<DocumentSnapshot> tasks = snapshot.data!.docs;
//           DateTime now = DateTime.now();
//
//           List<DocumentSnapshot> filteredTasks = tasks.where((task) {
//             DateTime? taskDate = task['taskDate']?.toDate(); // Updated field name here
//             bool isCompleted = task['isCompleted'] ?? false;
//
//             switch (category) {
//               case TaskCategory.Today:
//                 return isSameDay(taskDate ?? now, now);
//               case TaskCategory.NextDay:
//                 return taskDate != null &&
//                     isSameDay(taskDate, now.add(Duration(days: 1)));
//               case TaskCategory.Overdue:
//                 return taskDate != null && taskDate.isBefore(now) && !isCompleted;
//               case TaskCategory.Done:
//                 return isCompleted;
//               default:
//                 return false;
//             }
//           }).toList();
//
//           return ListView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: filteredTasks.length,
//             itemBuilder: (context, index) {
//               final doc = filteredTasks[index];
//               Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//
//               return ListTile(
//                 title: Text(data['taskDescription']), // Updated field name here
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Due Date: ${DateFormat.yMMMd().add_jm().format(data['taskDate']?.toDate() ?? DateTime.now())}', // Updated field name here
//                       style: const TextStyle(
//                         fontSize: 13,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     if (category == TaskCategory.Overdue)
//                       Text(
//                         'Overdue: ${DateFormat.yMMMd().add_jm().format(data['taskDate']?.toDate() ?? DateTime.now())}', // Updated field name here
//                         style: const TextStyle(
//                           fontSize: 13,
//                           color: Colors.red,
//                         ),
//                       ),
//                   ],
//                 ),
//                 leading: RoundCheckbox(
//                   value: data['isCompleted'] ?? false, // Updated field name here
//                   onChanged: (value) {
//                     FirebaseService().updateTaskCompletion(
//                         doc.id,
//                         value ?? false
//                     );
//                   },
//                 ),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => TaskDetails()),
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
//
//   }
// }
//
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