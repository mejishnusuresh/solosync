import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:provider/provider.dart';
import 'package:solosync/main.dart';
import 'package:solosync/screens/addprofilepage.dart';
import 'package:solosync/screens/contact/contactspage.dart';
import 'package:solosync/screens/drawer%20pages/callpage.dart';
import 'package:solosync/screens/drawer%20pages/dashboardpage.dart';
import 'package:solosync/screens/drawer%20pages/homepage.dart';
import 'package:solosync/screens/notificationpage.dart';
import 'package:solosync/screens/paymentspage.dart';
import 'package:solosync/screens/profilepage.dart';
import 'package:solosync/screens/settings.dart';

import 'intro/introslide.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentPageIndex = 0;

  late String userId;
  String _fullName ="";
  String _email="";
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _fetchProfileData();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
          drawer: currentPageIndex == 0
          ? Drawer(
            backgroundColor: Theme.of(context).primaryColor,

            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  buildHeader(context),
                  buildMenuItems(context),
                ],

              ),
            ),
          )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        // showSelectedLabels: false,
        currentIndex: currentPageIndex,
        selectedLabelStyle: GoogleFonts.inter(
            textStyle: const TextStyle(
                fontSize: 14,
                fontWeight:
                FontWeight.w500
            )
        ),

        onTap: (int index) {
            setState(() {
              currentPageIndex = index;
            });
        },
        items: [
          BottomNavigationBarItem(
            icon: Iconify(Ion.home, color: currentPageIndex == 0 ? Theme.of(context).primaryColor : Colors.grey),
            label: 'Home',

          ),
          BottomNavigationBarItem(
            icon: Iconify(Bx.bxs_analyse, color: currentPageIndex == 1 ? Theme.of(context).primaryColor : Colors.grey),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Iconify(Ic.round_call_end, color: currentPageIndex == 2 ? Theme.of(context).primaryColor : Colors.grey),
            label: 'Call Log',
          ),
        ],
      ),


      body: IndexedStack(
            index: currentPageIndex,
            children: [
              HomePage(scaffoldKey: _scaffoldKey),
              const DashBoardPage(),
              const CallPage(),
            ],
          ),
    );
  }

  Widget buildHeader(BuildContext context) => Material(
    color: Theme.of(context).primaryColor,
    child: Container(
      height: 230,
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top+40,left: 20,bottom: 20
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
          // onTap: (){
          //                   Navigator.push(
          //                     context,
          //                     // MaterialPageRoute(builder: (context) => const IntroSlider()//AddProfilePage()
          //    ),
          //                   );
          //                 },
            child: CircleAvatar(
              backgroundImage: _imageFile != null
                  ? FileImage(_imageFile!)
                  : const AssetImage('assets/icons/default.png') as ImageProvider<Object>?,
              radius: 40,
            ),
          ),
          const SizedBox(height: 10,),
          Text(
           _fullName,
            style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                )
            ),),
          Text(
            _email,
            style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.white
                )
            ),),
        ],
      ),
    ),
  );


  Widget buildMenuItems(BuildContext context) => Container(
    height: MediaQuery.of(context).size.height - 230,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      color: Colors.white,
    ),
    padding: const EdgeInsets.all(10),
    child: Column(
      children: [
        Wrap(
          spacing: 0,
          runSpacing: -10,
          children: [
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: Text(
                'Home',
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_2_outlined),
              title: Text(
                'Profile',
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.contacts_outlined),
              title: Text(
                'Contacts',
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.payments_outlined),
              title: Text(
                'Payments',
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PaymentsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: Text(
                'Settings',
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(left:16, bottom: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              },
              child: const Icon(
                Icons.dark_mode_outlined,
              ),
            ),
          ),
        ),
      ],
    ),
  );


  Future<void> _fetchProfileData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        userId = user.uid;
        DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('users').doc(userId).get();
        if (snapshot.exists) {
          Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
          setState(() {
            _fullName = data['fullName'] ?? '';
            _email = data['email'] ?? '';
          });
        }
      }
    } catch (e) {
      print('Error fetching profile data: $e');
    }
  }
}
