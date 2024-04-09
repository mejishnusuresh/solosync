import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solosync/screens/Auth/signpage.dart';
import 'package:solosync/services/authservice.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Stack(
            children: [
              Container(
                color: Theme.of(context).primaryColor,
              ),
              Positioned(
                top: 40,
                left: 3,
                child: Container(
                  width: 50,
                  height: 50,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white,),
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: (MediaQuery.of(context).size.width - 70) / 2,
                child: Container(
                  width: 70,
                  height: 50,
                  child: const Text("Settings",style: TextStyle(fontSize: 18,color: Colors.white),),
                ),
              ),
              Positioned(
                top: 150,
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
                    padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                    child: ListView(
                        children:  [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.lock_outline_rounded),
                              const SizedBox(width: 20,),
                              Text(
                                "Change Password",
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                      fontSize: 14,
                                    )
                                )
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.handshake_outlined),
                              const SizedBox(width: 20,),
                              Text(
                                  "Help",
                                  style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                    )
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.info_outline_rounded),
                              const SizedBox(width: 20,),
                              Text(
                                  "About",
                                  style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                      fontSize: 14,
                                    )
                                  ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 50,),
                          GestureDetector(
                            onTap: () async {
                              AuthService authService = AuthService();
                              await authService.signOut();
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SignPage()),
                              );
                            },
                            child: Text(
                              "Logout",
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                            ),
                          ),


                        ]

                    ),
                  ),

                ),
              ),










            ]
        )

    );
  }
}
