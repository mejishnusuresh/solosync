import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HomePage({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState(scaffoldKey: scaffoldKey);
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey;

  _HomePageState({required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    bool? _isSelected = false;

    return Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [

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
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
                    child: Column(
                      children: [
                        Container(
                          height: 320,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Card(
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('  Tasks',
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
                                                  color: Theme.of(context)
                                                      .primaryColor)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width: 75,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.1),
                                          ),
                                          child: Center(
                                              child: Text("Today",
                                                  style: GoogleFonts.inter(
                                                      textStyle: TextStyle(
                                                          color: Theme.of(context)
                                                              .primaryColor)))),
                                        ),
                                        Container(
                                          width: 75,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.1),
                                          ),
                                          child:
                                              const Center(child: Text("Overdue")),
                                        ),
                                        Container(
                                          width: 75,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.1),
                                          ),
                                          child: const Center(child: Text("Next")),
                                        ),
                                        Container(
                                          width: 75,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.1),
                                          ),
                                          child: const Center(child: Text("Done")),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Transform.scale(
                                                scale: 1.3,
                                                child: Radio(
                                                  value: true,
                                                  groupValue: _isSelected,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      _isSelected = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Task',
                                                    style: GoogleFonts.inter(
                                                        textStyle: const TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold)),
                                                  ),
                                                  Text(
                                                    'Task Description',
                                                    style: GoogleFonts.inter(
                                                        textStyle: const TextStyle(
                                                            fontSize: 13,
                                                            color: Colors.grey)),
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                          Icons.calendar_today_outlined,
                                                          size: 14,
                                                          color: Colors.grey),
                                                      Text(
                                                        ' Feb 9, 8:43 AM',
                                                        style: GoogleFonts.inter(
                                                            textStyle:
                                                                const TextStyle(
                                                                    color: Colors.grey,
                                                                    fontSize: 12)),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        const Divider(),
                                        const SizedBox(height: 8),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Transform.scale(
                                                scale: 1.3,
                                                child: Radio(
                                                  value: true,
                                                  groupValue: _isSelected,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      _isSelected = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Task',
                                                    style: GoogleFonts.inter(
                                                        textStyle: const TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold)),
                                                  ),
                                                  Text(
                                                    'Task Description',
                                                    style: GoogleFonts.inter(
                                                        textStyle: const TextStyle(
                                                            fontSize: 13,
                                                            color: Colors.grey)),
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                          Icons.calendar_today_outlined,
                                                          size: 14,
                                                          color: Colors.grey),
                                                      Text(
                                                        ' Feb 9, 8:43 AM',
                                                        style: GoogleFonts.inter(
                                                            textStyle:
                                                                const TextStyle(
                                                                    color:
                                                                        Colors.grey,
                                                                    fontSize: 12)),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.add,size: 18,),
                                      SizedBox(width: 8),
                                      Text(
                                          'Create a Task',
                                        style: GoogleFonts.inter(
                                            textStyle:
                                            const TextStyle(
                                                color:
                                                Colors.grey,
                                                fontSize: 14),)
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 240,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Card(
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
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
                                                  color: Theme.of(context)
                                                      .primaryColor)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width: 75,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.1),
                                          ),
                                          child: Center(
                                              child: Text("Today",
                                                  style: GoogleFonts.inter(
                                                      textStyle: TextStyle(
                                                          color: Theme.of(context)
                                                              .primaryColor)))),
                                        ),
                                        Container(
                                          width: 75,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.1),
                                          ),
                                          child:
                                              const Center(child: Text("Overdue")),
                                        ),
                                        Container(
                                          width: 75,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.1),
                                          ),
                                          child: const Center(child: Text("Next")),
                                        ),
                                        Container(
                                          width: 75,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.1),
                                          ),
                                          child: const Center(child: Text("Done")),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Transform.scale(
                                                scale: 1.3,
                                                child: Radio(
                                                  value: true,
                                                  groupValue: _isSelected,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      _isSelected = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Meeting',
                                                    style: GoogleFonts.inter(
                                                        textStyle: const TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold)),
                                                  ),
                                                  Text(
                                                    'Meeting Description',
                                                    style: GoogleFonts.inter(
                                                        textStyle: const TextStyle(
                                                            fontSize: 13,
                                                            color: Colors.grey)),
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                          Icons.calendar_today_outlined,
                                                          size: 14,
                                                          color: Colors.grey),
                                                      Text(
                                                        ' Feb 9, 8:43 AM',
                                                        style: GoogleFonts.inter(
                                                            textStyle:
                                                                const TextStyle(
                                                                    color:
                                                                        Colors.grey,
                                                                    fontSize: 12)),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.add,size: 18,),
                                      SizedBox(width: 8),
                                      Text('Create a Meeting',
                                          style: GoogleFonts.inter(
                                            textStyle:
                                            const TextStyle(
                                                color:
                                                Colors.grey,
                                                fontSize: 14),)
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ]
        )
    );
  }
}
