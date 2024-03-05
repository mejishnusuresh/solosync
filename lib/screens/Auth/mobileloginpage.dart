import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:solosync/screens/Auth/otploginpage.dart';

class MobileLoginPage extends StatefulWidget {
  const MobileLoginPage({Key? key}) : super(key: key);

  @override
  State<MobileLoginPage> createState() => _MobileLoginPageState();
}

class _MobileLoginPageState extends State<MobileLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 450),
              Text(
                "Enter Your Mobile Number",
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,

                    )
                ),
              ),
              Text(
                "We will send you a confirmation code",
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey
                    )
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width-60,
                  padding: const EdgeInsets.all(20),
                  child: IntlPhoneField(
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      counterText: '',
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),

                ),
              ),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OTPLoginPage()),
                  );
                },
                child: Container(
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Center(
                    child: Text(
                        "VERIFY",
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              Text(
                  "By Continuing you agree to Kaiztren CRM",
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey
                    )
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "Terms of use",
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                        ),
                    ),
                  ),
                  Text(
                    " & ",
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                        )
                    ),
                  ),
                  Text(
                    "Privacy Policy",
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                        )
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
