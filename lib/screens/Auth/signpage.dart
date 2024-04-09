import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solosync/screens/Auth/emailsignuppage.dart';
import 'package:solosync/screens/Auth/loginpage.dart';
import 'package:solosync/screens/Auth/mobilesignuppage.dart';
import 'package:solosync/screens/addprofilepage.dart';
import 'package:solosync/screens/navbar.dart';
import 'package:solosync/services/authservice.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {

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
              GestureDetector(
                onTap: () async {
                  AuthService authService = AuthService();
                  User? user = await authService.signInWithGoogle();
                  if (user != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddProfilePage()),
                    );
                  } else {
                    // Sign in failed
                    // Show an error message or handle the failure in a way that makes sense for your app
                  }
                },
                child: Container(
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
              ),

              const SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MobileSignUpPage()),
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
                    MaterialPageRoute(builder: (context) => const EmailSignUpPage()),
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
                            recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const LoginPage()),
                              );
                            },
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor,
                                  decoration: TextDecoration.underline,
                                )
                            ),
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