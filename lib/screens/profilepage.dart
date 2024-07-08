import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
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

  File? selectedImage;
  final ImagePicker _picker = ImagePicker();

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

  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      setState(() {
        _dobController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
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
              child: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
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
                      if (isEditing)
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
                            textStyle: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
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
              decoration: const BoxDecoration(
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
                        const SizedBox(height: 30),
                        textField(
                          label: "Phone",
                          icon: Icons.phone,
                          inputType: TextInputType.phone,
                          maxLines: 1,
                          controller: _mobileController,
                          enabled: isEditing,
                        ),
                        const SizedBox(height: 20),
                        textField(
                          enabled: isEditing,
                          label: "Email",
                          icon: Icons.email,
                          inputType: TextInputType.emailAddress,
                          maxLines: 1,
                          controller: _emailController,
                        ),
                        const SizedBox(height: 20),
                        textField(
                          enabled: isEditing,
                          label: "Designation",
                          icon: Icons.work,
                          inputType: TextInputType.text,
                          maxLines: 1,
                          controller: _designationController,
                        ),
                        const SizedBox(height: 20),
                        textField(
                          enabled: isEditing,
                          label: "Department",
                          icon: Icons.account_tree,
                          inputType: TextInputType.text,
                          maxLines: 1,
                          controller: _departmentController,
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            if (isEditing) {
                              _selectDate(context);
                            }
                          },
                          child: AbsorbPointer(
                            absorbing: !isEditing,
                            child: textField(
                              enabled: isEditing,
                              label: "DOB",
                              icon: Icons.date_range,
                              inputType: TextInputType.number,
                              maxLines: 1,
                              controller: _dobController,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        textField(
                          enabled: isEditing,
                          label: "Address",
                          icon: Icons.home_filled,
                          inputType: TextInputType.text,
                          maxLines: 4,
                          controller: _addressController,
                        ),
                        const SizedBox(height: 20),
                        Visibility(
                          visible: isEditing,
                          child: SizedBox(
                            width: 400,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () => _updateProfile(),
                              child: const Text('Save'),
                            ),
                          ),
                        ),
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

  Widget textField({
    required bool enabled,
    required String label,
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          label: Text(label),
          alignLabelWithHint: true,
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
            return "Please enter $label";
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
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
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
        });
      }
    } catch (e) {
      // Handle error
    }
  }

  Future<void> _pickAndUploadImage() async {
    final pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      File imageFile = File(pickedImage.path);
      setState(() {
        selectedImage = imageFile;
      });

      try {
        String fileName = 'profile_pictures/$userId.jpg';
        await FirebaseStorage.instance
            .ref()
            .child(fileName)
            .putFile(imageFile);
        String imageUrl = await FirebaseStorage.instance
            .ref()
            .child(fileName)
            .getDownloadURL();

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .update({'profileImage': imageUrl});
      } catch (e) {
        // Handle error
      }
    }
  }

  Future<void> _updateProfile() async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'fullName': _fullNameController.text,
        'mobile': _mobileController.text,
        'email': _emailController.text,
        'designation': _designationController.text,
        'department': _departmentController.text,
        'dob': _dobController.text,
        'address': _addressController.text,
      });

      setState(() {
        isEditing = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile updated successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update profile')),
      );
    }
  }
}
