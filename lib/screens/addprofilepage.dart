import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:solosync/screens/navbar.dart';

class AddProfilePage extends StatefulWidget {
  const AddProfilePage({Key? key}) : super(key: key);

  @override
  State<AddProfilePage> createState() => _AddProfilePageState();
}

class _AddProfilePageState extends State<AddProfilePage> {
  bool isEditing = true;
  late String userId;
  final formKey = GlobalKey<FormState>();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _companyAddressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _companyNameController = TextEditingController();
    _companyAddressController = TextEditingController();
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
            top: 250,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 250,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text("Hello", style: TextStyle(fontSize: 25)),
                        Text("Welcome to SoloSync",
                            style: TextStyle(fontSize: 18)),
                        SizedBox(height: 100),
                        Text("Name", style: TextStyle(fontSize: 14)),
                        TextFormField(
                          controller: _fullNameController,
                        ),
                        SizedBox(height: 20),
                        Text("Company Name", style: TextStyle(fontSize: 14)),
                        TextFormField(
                          controller: _companyNameController,
                        ),
                        SizedBox(height: 20),
                        Text("Company Address", style: TextStyle(fontSize: 14)),
                        TextFormField(
                          controller: _companyAddressController,
                        ),
                        SizedBox(height: 50),
                        Center(
                          child: ElevatedButton(
                              onPressed: () {
                                _saveProfile();
                              },
                              child: Text("Save")),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _companyNameController.dispose();
    _companyAddressController.dispose();
    super.dispose();
  }

  Future _saveProfile() async {
    try {
      if (formKey.currentState!.validate()) {
        setState(() {});

        User? user = FirebaseAuth.instance.currentUser;
        userId = user!.uid;
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .update({
          'fullName': _fullNameController.text,
          'companyName': _companyNameController.text,
          'companyAddress': _companyAddressController.text,
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NavBar()),
        );
      }
    } catch (error) {
      setState(() {
        isEditing = false;
      });
      print(error);
    }
  }
}
