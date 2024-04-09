import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solosync/services/authservice.dart';
import 'package:solosync/services/databseservice.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  AuthService authService = AuthService();
  DatabaseService databaseService = DatabaseService();

  late String userId;
  final formKey = GlobalKey<FormState>();
  bool isEditing = false;
  //UploadTask? uploadTask;

  File? selectedImage;
  final ImagePicker _picker = ImagePicker();


  // String? selectedGender;
  // Set<String> genders = {
  //   'Male',
  //   'Female',
  //   'Other',
  // };

  late TextEditingController _fullNameController;
  late TextEditingController _mobileController;
  late TextEditingController _emailController;
  late TextEditingController _designationController;
  late TextEditingController _departmentController;
  late TextEditingController _dobController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();

    _fullNameController = TextEditingController();
    _mobileController = TextEditingController();
    _emailController = TextEditingController();
    _designationController = TextEditingController();
    _departmentController = TextEditingController();
    _dobController = TextEditingController();
    _addressController = TextEditingController();

    _fetchProfileData();

  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
          ),
          Positioned(
            top: 70,
            right: 20,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isEditing = true;
                });
              },
              child: const Icon(Icons.edit,color: Colors.white,),
            ),
          ),
          Positioned(
            top: 70,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(screenWidth * 0.2),
                        child: Container(
                          alignment: Alignment.center,
                          constraints: BoxConstraints(
                            maxWidth: screenWidth * 0.35,
                            maxHeight: screenWidth * 0.35,
                          ),
                          color: Color.fromARGB(255, 151, 151, 151),
                          child: selectedImage != null
                              ? Image.file(
                            selectedImage!,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          )
                              : Image.asset(
                            "assets/icons/default.png",
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),


                      // CircleAvatar(
                      //   backgroundImage: _imageFile != null && _imageFile!.existsSync()
                      //       ? FileImage(_imageFile!)
                      //       : AssetImage('assets/icons/default.png') as ImageProvider,
                      //   radius: 50,
                      // ),


                      if(isEditing)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                            icon: const Icon(Icons.add_photo_alternate),
                            onPressed: () {
                              _pickAndUploadImage();
                            },
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: TextFormField(
                        enabled: isEditing,
                        controller: _fullNameController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: "Full Name",
                          border: InputBorder.none,
                        ),
                        style: GoogleFonts.inter(
                            textStyle:  const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 300,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration:  const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const SizedBox(height: 40),
                        textField(
                          hindText: "Phone",
                          icon: Icons.phone,
                          inputType: TextInputType.phone,
                          maxLines: 1,
                          controller: _mobileController,
                          enabled: isEditing,
                        ),
                        textField(
                          enabled: isEditing,
                          hindText: "Email",
                          icon: Icons.email,
                          inputType: TextInputType.emailAddress,
                          maxLines: 1,
                          controller: _emailController,
                        ),
                        textField(
                          enabled: isEditing,
                          hindText: "Designation",
                          icon: Icons.work,
                          inputType: TextInputType.text,
                          maxLines: 1,
                          controller: _designationController,
                        ),
                        textField(
                          enabled: isEditing,
                          hindText: "Department",
                          icon: Icons.account_tree,
                          inputType: TextInputType.text,
                          maxLines: 1,
                          controller: _departmentController,
                        ),

                        textField(
                          enabled: isEditing,
                          hindText: "DOB",
                          icon: Icons.date_range,
                          inputType: TextInputType.number,
                          maxLines: 1,
                          controller: _dobController,
                        ),
                        textField(
                          enabled: isEditing,
                          hindText: "Address",
                          icon: Icons.home_filled,
                          inputType: TextInputType.text,
                          maxLines: 4,
                          controller: _addressController,
                        ),

                        Visibility(
                          visible: isEditing,
                          child: ElevatedButton(
                            onPressed: () => _updateProfile(),
                            child: const Text('Save'),
                          ),
                        ),
                    
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 275,
            left: 30,
            right: 30,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),

                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                        ),
                        child: const Icon(Icons.arrow_back),
                      ),
                      const SizedBox(width: 70),
                      Text("Back to Home",
                        style: GoogleFonts.inter(
                            textStyle:  const TextStyle(
                                fontSize: 16,
                                color: Colors.white
                            )
                        ),),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget textField({
    required bool enabled,
    required String hindText,
    required IconData icon,
    required TextInputType inputType,
    required int maxLines,
    required TextEditingController controller,
  }) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        enabled: enabled,
        cursorColor: Theme.of(context).primaryColor,
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Theme.of(context).primaryColor),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          hintText: hindText,
          alignLabelWithHint: true,
          border: InputBorder.none,
          hintStyle: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 28,
              color: Colors.white,
            ),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter $hindText";
          }
          return null;
        },
      ),
    );
  }


  Future<void> _fetchProfileData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      userId = user!.uid;
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('users').doc(userId).get();
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        setState(() {
          _fullNameController.text = data['fullName'] ?? '';
          _mobileController.text = data['mobile'] ?? '';
          _emailController.text = data['email'] ?? '';
          _designationController.text = data['designation'] ?? '';
          _departmentController.text = data['department'] ?? '';
          _dobController.text = data['dob'] ?? '';
          _addressController.text = data['address'] ?? '';
          if (data.containsKey('profilePic')) {
            String profilePicUrl = data['profilePic'];
            selectedImage = File(profilePicUrl);
            print(selectedImage);
          }
        });
      }
    } catch (e) {
      print('Error fetching profile data: $e');
    }
  }




  Future<void> _updateProfile() async {
    try {
      if (formKey.currentState!.validate()) {
        setState(() {
          isEditing = false;
        });

        await FirebaseFirestore.instance.collection('users').doc(userId).update({
          'fullName': _fullNameController.text,
          'mobile': _mobileController.text,
          'email': _emailController.text,
          'designation': _designationController.text,
          'department': _departmentController.text,
          'dob': _dobController.text,
          'address': _addressController.text,
        });

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Profile updated successfully.'),
        ));
      }
    } catch (error) {
      print('Error updating profile: $error');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to update profile.'),
      ));
    }
  }


  Future<void> _pickAndUploadImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          selectedImage = File(pickedFile.path);
        });

        final String userId = FirebaseAuth.instance.currentUser!.uid;
        Reference storageReference = FirebaseStorage.instance.ref().child('profile_images/${userId}/pp.jpg');
        UploadTask uploadTask = storageReference.putFile(selectedImage!);
        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

        String imageUrl = await storageReference.getDownloadURL();

        // final imageFile = File(pickedFile.path);
        //
        // final String userId = FirebaseAuth.instance.currentUser!.uid;
        //final Reference ref = FirebaseStorage.instance.ref().child('profile_images').child('$userId.jpg');
        // final TaskSnapshot uploadTask = await ref.putFile(imageFile);
        // final String imageUrl = await uploadTask.ref.getDownloadURL();

        await FirebaseFirestore.instance.collection('users').doc(userId).update({
          'profilePic': imageUrl,
        });

        setState(() {});

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Profile image uploaded successfully.'),
        ));
      }
    } catch (error) {
      print('Error uploading image: $error');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to upload profile image.'),
      ));
    }
  }


  @override
  void dispose() {
    _fullNameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _designationController.dispose();
    _departmentController.dispose();
    _dobController.dispose();
    _addressController.dispose();
    super.dispose();
  }
}