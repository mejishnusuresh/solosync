import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Stack(
            children: [
              Container(
                color: Theme.of(context).primaryColor,
              ),

              Positioned(
                top: 90,
                child: Container(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Notifications",
                      style: GoogleFonts.inter(
                          textStyle:  const TextStyle(
                              color:Colors.white,
                              fontSize: 20,
                              fontWeight:
                              FontWeight.bold
                          )
                      ),
                    ),
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
                  child: Column(
                      children: [

                        const SizedBox(height: 20,),
                        Container(
                          width: double.infinity,
                          child:  ListTile(
                            leading: const Icon(Icons.message_outlined,color: Colors.grey,),
                            title: Text("Abraham Mathew",style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight:
                                    FontWeight.bold)),),
                            subtitle: Text("Subject of Message",style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontSize: 13,color: Colors.grey),),),

                          ),
                        ),
                        const Divider(),
                        Container(
                          width: double.infinity,
                          child: ListTile(
                            leading: const Icon(Icons.message_outlined,color: Colors.grey,),
                            title: Text("Kurian John",style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight:
                                    FontWeight.bold)),),
                            subtitle: Text("Subject of Message",style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 13,color: Colors.grey)),),

                          ),
                        ),


                        const Divider(),

                        Container(
                          width: double.infinity,
                          child:  ListTile(
                            leading: const Icon(Icons.message_outlined,color: Colors.grey,),
                            title: Text("Abraham Mathew",style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight:
                                    FontWeight.bold)),),
                            subtitle: Text("Subject of Message",style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontSize: 13,color: Colors.grey),),),

                          ),
                        ),
                        const Divider(),

                        Container(
                          width: double.infinity,
                          child: ListTile(
                            leading: const Icon(Icons.message_outlined,color: Colors.grey,),
                            title: Text("Kurian John",style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight:
                                    FontWeight.bold)),),
                            subtitle: Text("Subject of Message",style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 13,color: Colors.grey)),),
                          ),
                        ),

                      ]
                  ),

                ),
              ),

            ]
        )
    );
  }
}
