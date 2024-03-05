import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solosync/screens/Auth/emailloginpage.dart';
import 'package:solosync/screens/Auth/mobileloginpage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              const SizedBox(height: 450,),
              Container(

              ),

              Text(
                "Sign Up",
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,

                    )
                ),
              ),
              Text(
                "Its easier to sign up now ",
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey

                    )
                ),
              ),
              const SizedBox(height: 50,),
              Container(
                height: 50,
                width: 300,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: Colors.black,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset('assets/icons/google-icon.png'),
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(width: 20,),
                    Text(
                      "Continue with Google",
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          )
                      ),
                    ),
                    const SizedBox(width: 20,),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MobileLoginPage()),
                  );
                },
                child: Container(
                    height: 40,
                    width: 280,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(40)),
                        border: Border.all(color: Theme.of(context).primaryColor)
                    ),
                    child: Align(
                      alignment:Alignment.center,
                      child: Text(
                        "Continue with phone",
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )
                        ),
                      ),
                    )
                ),
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EmailLoginPage()),
                  );
                },
                child: Container(
                    height: 40,
                    width: 280,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(40)),
                        border: Border.all(color: Theme.of(context).primaryColor)
                    ),
                    child: Align(
                      alignment:Alignment.center,
                      child: Text(
                          "Continue with Email",
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              )
                          )
                      ),
                    )
                ),
              ),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Already have an account? ",
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black
                                )
                            )
                        ),
                        TextSpan(
                            text: "Login",
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor,
                                  decoration: TextDecoration.underline,
                                )
                            )
                        )
                      ],
                    ),
                  ),
                ],
              ),




            ],
          ),
        ),
      ),

    );
  }
}