import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solosync/screens/navbar.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              const SizedBox(height: 400,),
              Container(

              ),

              Text(
                "Successfully",
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,

                    )
                ),
              ),
              Text(
                "Your Account has been Created.",
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey

                    )
                ),
              ),
              const SizedBox(height: 100,),

              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NavBar())
                  );
                },
                child: Container(
                    height: 40,
                    width: 280,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(40)),
                        color: Theme.of(context).primaryColor
                    ),
                    child: Align(
                      alignment:Alignment.center,
                      child: Text(
                        "LET'S GO",
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ),
                    )
                ),
              ),



            ],
          ),
        ),
      ),

    );
  }
}