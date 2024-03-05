import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/ep.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:provider/provider.dart';
import 'package:solosync/main.dart';
import 'package:solosync/screens/contact/contactspage.dart';
import 'package:solosync/screens/drawer%20pages/callpage.dart';
import 'package:solosync/screens/drawer%20pages/dashboardpage.dart';
import 'package:solosync/screens/drawer%20pages/homepage.dart';
import 'package:solosync/screens/drawer%20pages/notificationpage.dart';
import 'package:solosync/screens/profilepage.dart';
import 'package:solosync/screens/quotespage.dart';
import 'package:solosync/screens/settings.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentPageIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //popup function here
  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.sizeOf(context).width-20,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ContactsPage()),
                        );
                      },
                      child: Row(
                        children: [
                          Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(Icons.contacts_rounded,color: Theme.of(context).primaryColor,)
                          ),
                          const SizedBox(width: 8,),
                          const Text("Contacts",style: TextStyle(fontSize: 18,),)

                        ],
                      ),
                    ),
                    const SizedBox(height: 8,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const QuotesPage()),
                        );
                      },
                      child: Row(
                        children: [
                          Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(Icons.format_list_numbered_rounded,color: Theme.of(context).primaryColor,)
                          ),
                          const SizedBox(width: 8,),
                          const Text("Quotes",style: TextStyle(fontSize: 18,),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

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
        showSelectedLabels: false,
        currentIndex: currentPageIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          if (index == 4) {
            //popup function calling here
            _showMoreOptions(context);
          } else {
            setState(() {
              currentPageIndex = index;
            });
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Iconify(Ion.home, color: currentPageIndex == 0 ? Theme.of(context).primaryColor : Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Iconify(Ic.round_call_end, color: currentPageIndex == 1 ? Theme.of(context).primaryColor : Colors.grey),
            label: 'Call Log',
          ),
          BottomNavigationBarItem(
            icon: Iconify(Bx.bxs_analyse, color: currentPageIndex == 2 ? Theme.of(context).primaryColor : Colors.grey),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Iconify(Ic.baseline_notifications_active, color: currentPageIndex == 3 ? Theme.of(context).primaryColor : Colors.grey),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Iconify(Ep.more_filled, color: currentPageIndex == 4 ? Theme.of(context).primaryColor : Colors.grey),
            label: 'More',
          ),
        ],
      ),


      body: IndexedStack(
            index: currentPageIndex,
            children: [
              HomePage(scaffoldKey: _scaffoldKey),
              const CallPage(),
              const DashBoardPage(),
              const NotificationPage(),
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
          const CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage("https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg"),
          ),
          const SizedBox(height: 10,),
          Text(
            "John Abraham",
            style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                )
            ),),
          Text(
            "johnabraham@gmail.com",
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
                Navigator.pushReplacementNamed(context, '/payments');
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

}
