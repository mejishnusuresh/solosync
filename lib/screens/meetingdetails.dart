import 'package:flutter/material.dart';

class MeetingDetails extends StatefulWidget {
  const MeetingDetails({super.key});

  @override
  State<MeetingDetails> createState() => _MeetingDetailsState();
}

class _MeetingDetailsState extends State<MeetingDetails> {
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50,),
                    const Text("Meeting 1"),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Icon(Icons.person),
                        ),
                        const SizedBox(width: 20,),
                        Column(
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
                          child: Icon(Icons.person),
                        ),
                        const SizedBox(width: 20,),
                        Column(
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
                          child: Icon(Icons.person),
                        ),
                        const SizedBox(width: 20,),
                        Column(
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
                          child: Icon(Icons.person),
                        ),
                        const SizedBox(width: 20,),
                        Column(
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
                            )

                          ],
                        ),

                      ],
                    ),


                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }



}
