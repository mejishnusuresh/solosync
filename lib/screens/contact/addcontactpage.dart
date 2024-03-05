import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {

  DateTime? selectedDate;

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
            right: 3,
            child: Container(
              width: 50,
              height: 50,
              child: const Text("Save",style: TextStyle(fontSize: 18,color: Colors.white),),
            ),
          ),

          Positioned(
            top: 100,
            left: (MediaQuery.of(context).size.width - 400) / 2,
            child: Container(
              width: 400,
              height: 300,
              child: const Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person,size: 40,color: Colors.white,),
                  ),


                ],
              ),
            ),
          ),

          Positioned(
            top: 210,
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
                padding: const EdgeInsets.only(left: 16.0,right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 30,),

                    Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0,right: 16.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Name",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      height: 120,
                      child: Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0,right: 16.0),
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Company",
                                ),
                              ),
                              const Divider(),
                              TextFormField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Department",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Container(
                          height: 50,
                          child: Row(
                            children: [
                              SizedBox(width:70,child: const Text("Mobile")),
                              const VerticalDivider(),
                              Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Mobile",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10,),

                    Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Container(
                          height: 50,
                          child: Row(
                            children: [
                              SizedBox(width:70,child: const Text("Email")),
                              const VerticalDivider(),
                              Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Container(
                          height: 50,
                          child: Row(
                            children: [
                              SizedBox(width:70,child: const Text("DOB")),
                              const VerticalDivider(),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    final DateTime? picked = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2020),
                                      lastDate: DateTime(2030),
                                    );
                                    if (picked != null && picked != selectedDate) {
                                      setState(() {
                                        selectedDate = picked;
                                      });
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        selectedDate != null
                                            ? DateFormat('dd/MM/yyyy').format(selectedDate!)
                                            : 'DD/MM/YYYY',
                                      ),
                                      const Icon(Icons.arrow_drop_down),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10,),
                    Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Container(
                          height: 50,
                          child: Row(
                            children: [
                              SizedBox(width:70,child: const Text("Adress")),
                              const VerticalDivider(),
                              Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: "Address",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20,),
                    Text("Add another field",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 16),),


                  ],
                ),
              ),
            ),
          ),


        ],
      ),

    );
  }
}
