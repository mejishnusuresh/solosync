import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solosync/screens/schedulecall.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CallPage extends StatefulWidget {
  const CallPage({Key? key}) : super(key: key);

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  int? selectedIndex = 0;

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
            top: 90,
            child: Container(
              height: 30,
              child: ToggleSwitch(
                minWidth: 150.0,
                cornerRadius: 20.0,
                activeFgColor: Theme.of(context).primaryColor,
                activeBgColor: [const Color(0xFFcbc1f9)],
                inactiveBgColor: Colors.white,
                inactiveFgColor: Colors.black,
                initialLabelIndex: selectedIndex,
                totalSwitches: 2,
                labels: ['Call Log', 'Scheduled'],
                radiusStyle: true,
                onToggle: (index) {
                  setState(() {
                    selectedIndex = index ?? 0;
                  });
                },

              ),
            ),
          ),
          Positioned(
            top: 160,
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
              child: selectedIndex == 0 ? _buildCallLog() : _buildScheduledCalls(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCallLog() {
      return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            color: Colors.white,
          ),
          child: Column(
              children: [

                const SizedBox(height: 20,),

                Container(
                  width: double.infinity,
                  child:  ListTile(
                    leading: const Icon(Icons.call_outlined,color: Colors.grey,),
                    title: Text("Abraham Mathew",style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight:
                        FontWeight.bold)),),
                    subtitle: Text("Company Name",style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 13,color: Colors.grey),),),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [

                        Text('18:00',style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 12,color: Colors.grey),),)


                      ],
                    ),
                  ),
                ),
                const Divider(),

                Container(
                  width: double.infinity,
                  child: ListTile(
                    leading: const Icon(Icons.call_outlined,color: Colors.grey,),
                    title: Text("Kurian John",style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight:
                        FontWeight.bold)),),
                    subtitle: Text("Company Name",style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 13,color: Colors.grey)),),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [

                        Text('18:30',style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 12,color: Colors.grey)),),

                      ],
                    ),
                  ),
                ),


                const Divider(),

                Container(
                  width: double.infinity,
                  child:  ListTile(
                    leading: const Icon(Icons.call_outlined,color: Colors.grey,),
                    title: Text("Abraham Mathew",style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight:
                            FontWeight.bold)),),
                    subtitle: Text("Company Name",style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        fontSize: 13,color: Colors.grey),),),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [

                        Text('Yesterday',style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 12,color: Colors.grey),),)


                      ],
                    ),
                  ),
                ),
                const Divider(),

                Container(
                  width: double.infinity,
                  child: ListTile(
                    leading: const Icon(Icons.call_outlined,color: Colors.grey,),
                    title: Text("Kurian John",style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight:
                            FontWeight.bold)),),
                    subtitle: Text("Company Name",style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontSize: 13,color: Colors.grey)),),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [

                        Text('18/03/2023',style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontSize: 12,
                                color: Colors.grey)),),

                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),

              ]
          ),
        ),
      );
    }
  }

  Widget _buildScheduledCalls(BuildContext context) {
  return Scaffold(
    backgroundColor: Theme.of(context).primaryColor,
    body : Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 10,right: 10),

            child: Column(
              children: [

                Container(
                    width: double.infinity,
                    child: Card(
                      color:Colors.white,
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 35,
                                      height: 35,
                                      color: Colors.grey,
                                      child: const Icon(Icons.person, color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Abraham Mathew',style: GoogleFonts.inter(
                                          textStyle: const TextStyle(
                                              fontSize: 15,
                                              fontWeight:
                                              FontWeight.bold)),),
                                      Text(
                                        'Company Name',style: GoogleFonts.inter(
                                          textStyle: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey),),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Description of Call',
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey),),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.calendar_today_outlined, size: 14,color: Colors.grey),
                                Text(
                                  ' Feb 9, 8:43 AM',style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey),),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  child: Card(
                    color:Colors.white,
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 35,
                                    height: 35,
                                    color: Colors.grey,
                                    child: const Icon(Icons.person, color: Colors.white),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Abraham Mathew',style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                            FontWeight.bold)),),
                                    Text(
                                      'Company Name',style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey),),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Description of Call',
                            style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey),),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.calendar_today_outlined, size: 14,color: Colors.grey),
                              Text(
                                ' Feb 9, 8:43 AM',style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey),),
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
          ),
        ],
      ),

    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ScheduleCallPage()),
        );
      },
      child: const Icon(Icons.add,color: Colors.white,size: 30,),
      shape: const CircleBorder(),
      backgroundColor: Theme.of(context).primaryColor,
    ),
  );
}







