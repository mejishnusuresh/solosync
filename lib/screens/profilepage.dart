import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                    backgroundColor: Theme.of(context).primaryColor,
                    backgroundImage: const NetworkImage('https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg'),
                  ),
                  const Text(
                    "John Abraham",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,color: Colors.white),
                  ),
                  const Text(
                   "@user011",
                    style: TextStyle(fontSize: 20,color: Colors.white),
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
              child: const Padding(
                padding: EdgeInsets.only(left: 16.0,right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text( "Mobile",style: TextStyle(fontSize: 20),),
                    SizedBox(height: 8,),
                    // Text(
                    //   "${contact["mobile"]}",
                    // ),
                    // const Divider(),

                    SizedBox(height: 20),
                    Text( "Email",style: TextStyle(fontSize: 20),),
                    SizedBox(height: 8,),
                    // Text(
                    //   "${contact["email"]}",
                    // ),
                    // const Divider(),

                    SizedBox(height: 20),
                    Text( "Department",style: TextStyle(fontSize: 20),),
                    SizedBox(height: 8,),
                    // Text(
                    //   "${contact["department"]}",
                    // ),
                    Divider(),

                    SizedBox(height: 20),
                    Text( "DOB",style: TextStyle(fontSize: 20),),
                    SizedBox(height: 8,),
                    // Text(
                    //   "${contact["dob"]}",
                    // ),
                    Divider(),


                    SizedBox(height: 20),
                    Text( "Address",style: TextStyle(fontSize: 20),),
                    SizedBox(height: 8,),
                    // Text(
                    //   "${contact["address"]}",
                    // ),
                    Divider(),

                    SizedBox(height: 20),
                    Text( "Social Handlers",style: TextStyle(fontSize: 20),),
                    SizedBox(height: 8,),
                    // Text(
                    //   "${contact["socialHandlers"]}",
                    // ),

                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 270,
            left: 30,
            right: 30,
            child: GestureDetector(
              onTap: (){},
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                      ),
                    ),
                    const Text("Back to Home"),

                  ],
                ),
              ),
            ),
          ),

          const Text("hello"),
        ],
      ),


    );
  }
}
