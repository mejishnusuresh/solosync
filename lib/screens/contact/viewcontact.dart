import 'package:flutter/material.dart';

class ViewContactPage extends StatelessWidget {
  final Map<String, dynamic> contact;

  const ViewContactPage({Key? key, required this.contact}) : super(key: key);

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
              child: const Text("Contact",style: TextStyle(fontSize: 18,color: Colors.white),),
            ),
          ),
          Positioned(
            top: 50,
            right: 3,
            child: Container(
              width: 50,
              height: 50,
              child: const Text("Edit",style: TextStyle(fontSize: 18,color: Colors.white),),
            ),
          ),

          Positioned(
            top: 90,
            left: (MediaQuery.of(context).size.width - 400) / 2,
            child: Container(
              width: 400,
              height: 300,
              child: Column(
                children: [
                   CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.blue,
                    backgroundImage: NetworkImage(contact["image"]),
                  ),
                  Text(
                    contact["name"],
                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 28,color: Colors.white),
                  ),
                  Text(
                    contact["place"],
                    style: const TextStyle(fontSize: 20,color: Colors.white),
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
                padding: const EdgeInsets.only(left: 16.0,right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text( "Mobile",style: const TextStyle(fontSize: 20),),
                    const SizedBox(height: 8,),
                    Text(
                      "${contact["mobile"]}",
                    ),
                    const Divider(),

                    const SizedBox(height: 20),
                    const Text( "Email",style: const TextStyle(fontSize: 20),),
                    const SizedBox(height: 8,),
                    Text(
                      "${contact["email"]}",
                    ),
                    const Divider(),

                    const SizedBox(height: 20),
                    const Text( "Department",style: const TextStyle(fontSize: 20),),
                    const SizedBox(height: 8,),
                    Text(
                      "${contact["department"]}",
                    ),
                    const Divider(),

                    const SizedBox(height: 20),
                    const Text( "DOB",style: const TextStyle(fontSize: 20),),
                    const SizedBox(height: 8,),
                    Text(
                      "${contact["dob"]}",
                    ),
                    const Divider(),


                    const SizedBox(height: 20),
                    const Text( "Address",style: const TextStyle(fontSize: 20),),
                    const SizedBox(height: 8,),
                    Text(
                      "${contact["address"]}",
                    ),
                    const Divider(),

                    const SizedBox(height: 20),
                    const Text( "Social Handlers",style: const TextStyle(fontSize: 20),),
                    const SizedBox(height: 8,),
                    Text(
                      "${contact["socialHandlers"]}",
                    ),

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
