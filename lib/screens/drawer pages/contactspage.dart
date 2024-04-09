import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:solosync/screens/contact/addcontactpage.dart';
import 'package:solosync/screens/contact/viewcontact.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final List<Map<String, dynamic>> contacts = [
    {
      "name": "John Doe",
      "place": "New York",
      "image": "https://randomuser.me/api/portraits/men/1.jpg"
    },
    {
      "name": "Jane Smith",
      "place": "Los Angeles",
      "image": "https://randomuser.me/api/portraits/women/2.jpg"
    },
    {
      "name": "Alice Johnson",
      "place": "Chicago",
      "image": "https://randomuser.me/api/portraits/women/3.jpg"
    },
    {
      "name": "Robert Brown",
      "place": "Houston",
      "image": "https://randomuser.me/api/portraits/men/4.jpg"
    },
    {
      "name": "Emma Wilson",
      "place": "Miami",
      "image": "https://randomuser.me/api/portraits/women/5.jpg"
    },
    {
      "name": "Michael Davis",
      "place": "Philadelphia",
      "image": "https://randomuser.me/api/portraits/men/6.jpg"
    },
    {
      "name": "Sarah Garcia",
      "place": "Phoenix",
      "image": "https://randomuser.me/api/portraits/women/7.jpg"
    },
    {
      "name": "William Rodriguez",
      "place": "San Antonio",
      "image": "https://randomuser.me/api/portraits/men/8.jpg"
    },
    {
      "name": "Emily Martinez",
      "place": "San Diego",
      "image": "https://randomuser.me/api/portraits/women/9.jpg"
    },
    {
      "name": "Daniel Hernandez",
      "place": "Dallas",
      "image": "https://randomuser.me/api/portraits/men/10.jpg"
    },
    {
      "name": "Olivia Lopez",
      "place": "San Jose",
      "image": "https://randomuser.me/api/portraits/women/11.jpg"
    },
    {
      "name": "Matthew Gonzalez",
      "place": "Austin",
      "image": "https://randomuser.me/api/portraits/men/12.jpg"
    },
    {
      "name": "Sophia Perez",
      "place": "Jacksonville",
      "image": "https://randomuser.me/api/portraits/women/13.jpg"
    },
    {
      "name": "James Carter",
      "place": "Indianapolis",
      "image": "https://randomuser.me/api/portraits/men/14.jpg"
    },
    {
      "name": "Isabella Torres",
      "place": "San Francisco",
      "image": "https://randomuser.me/api/portraits/women/15.jpg"
    },
    {
      "name": "David Wilson",
      "place": "Columbus",
      "image": "https://randomuser.me/api/portraits/men/16.jpg"
    },
    {
      "name": "Ava Anderson",
      "place": "Fort Worth",
      "image": "https://randomuser.me/api/portraits/women/17.jpg"
    },
    {
      "name": "Joseph Thomas",
      "place": "Charlotte",
      "image": "https://randomuser.me/api/portraits/men/18.jpg"
    },
  ];

  String _searchQuery = '';

  List<Map<String, dynamic>> get _filteredContacts {
    return contacts
        .where((contact) => contact['name']
            .toString()
            .toLowerCase()
            .contains(_searchQuery.toLowerCase()))
        .toList();
  }

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
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: (MediaQuery.of(context).size.width - 100) / 2,
            child: Container(
              width: 100,
              height: 50,
              child: Text(
                "Contacts",
                style: GoogleFonts.inter(
                    textStyle:  const TextStyle(
                        fontSize: 18,
                      color: Colors.white
                    )
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 3,
            child: Container(
              width: 50,
              height: 50,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.filter_alt_sharp,
                  color: Colors.white,
                ),
              ),
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
                child: GroupedListView<dynamic, String>(
                  elements: _filteredContacts, // Use filtered contacts here
                  groupBy: (element) => element["name"][0],
                  groupSeparatorBuilder: (String groupByValue) => Column(
                    children: [

                      Container(
                        height: 30,
                        color: Colors.black12,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              groupByValue,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                  textStyle:  const TextStyle(
                                      fontSize: 16,
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  itemBuilder: (context, dynamic contact) {
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(contact["image"]),
                      ),
                      title: Text(
                        contact["name"],

                      ),
                      subtitle: Text(contact["place"],style: GoogleFonts.inter(
                          textStyle:  const TextStyle(
                              fontSize: 14,
                          )
                      ),),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ViewContactPage(contact: contact)),
                        );
                      },
                    );
                  },
                  order: GroupedListOrder.ASC,
                )),
          ),
          Positioned(
            top: 120,
            left: 30,
            right: 30,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        hintText: "Search Contact",
                      ),
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Handle search button press
                    },
                    icon: const Icon(Icons.search_rounded),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddContactPage()),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
