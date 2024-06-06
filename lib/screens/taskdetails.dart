import 'package:flutter/material.dart';


class TaskDetails extends StatefulWidget {
  const TaskDetails({super.key});

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),

      ),
      body: Stack(
        children: [

          Container(
            color: Theme.of(context).primaryColor,
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                color: Colors.white,
              ),
              height: MediaQuery.of(context).size.height - 100,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20,),
                        const Text("Task 1",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                        const SizedBox(height: 15,),
                        Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              child: const Icon(Icons.person),
                            ),
                            const SizedBox(width: 20,),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Contact",
                                    style: TextStyle(
                                      fontSize: 12,
                                    )
                                ),
                                Text(
                                    "Marc Jr.",
                                    style: TextStyle(
                                      fontSize: 12,
                                    )
                                )

                              ],
                            ),

                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              child: const Icon(Icons.check_circle_outline),
                            ),
                            const SizedBox(width: 20,),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Status",
                                    style: TextStyle(
                                      fontSize: 12,
                                    )
                                ),
                                Text(
                                    "Complete",
                                    style: TextStyle(
                                      fontSize: 12,
                                    )
                                )

                              ],
                            ),

                          ],
                        ),

                        const SizedBox(height: 20,),
                        Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              child: const Icon(Icons.calendar_month),
                            ),
                            const SizedBox(width: 20,),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Due Date",
                                    style: TextStyle(
                                      fontSize: 12,
                                    )
                                ),
                                Text(
                                    "Mar 16",
                                    style: TextStyle(
                                      fontSize: 12,
                                    )
                                )

                              ],
                            ),

                          ],
                        ),

                        const SizedBox(height: 20,),
                        Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              child: const Icon(Icons.watch_later),
                            ),
                            const SizedBox(width: 20,),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Due Time",
                                    style: TextStyle(
                                      fontSize: 12,
                                    )
                                ),
                                Text(
                                    "04:00 PM",
                                    style: TextStyle(
                                      fontSize: 12,
                                    )
                                ),

                              ],
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 20,
                    color: Colors.black12.withOpacity(0.05),
                  ),
                  const SizedBox(height: 10,),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 14,
                          )
                      ),
                      Text(
                          "Here shows the description of the task that we are given to\nthe task, Make sure the text is given much better, hope you\nunderstand what we meant." ,
                          style: TextStyle(
                            fontSize: 12,
                          )
                      ),
                    ],
                  ),

                  const SizedBox(height: 10,),
                  Container(
                    height: 20,
                    color: Colors.black12.withOpacity(0.05),
                  ),
                  const SizedBox(height: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Reminder",
                          style: TextStyle(
                            fontSize: 14,
                          )
                      ),
                      Row(
                        children: [
                          Icon(Icons.access_alarm),
                          Container(
                            child: Text("15 min Before"),
                          ),
                        ],
                      )
                      // Text(
                      //
                      //     style: TextStyle(
                      //       fontSize: 12,
                      //     )
                      // ),
                    ],
                  ),

                ],

              ),
            ),

          )
        ],
      ),
    );
  }



}
