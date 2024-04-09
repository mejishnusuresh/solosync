import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:solosync/screens/Auth/otppage.dart';

class MobileSignUpPage extends StatefulWidget {
  const MobileSignUpPage({Key? key}) : super(key: key);

  @override
  State<MobileSignUpPage> createState() => _MobileSignUpPageState();
}

class _MobileSignUpPageState extends State<MobileSignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                    ),
                  ),
                ),
                Text(
                  "We will send you a confirmation code",
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
                //
                // Row(
                //   children: [
                //     const CountryCodePicker(
                //       onChanged: print,
                //       initialSelection: 'IN',
                //       showCountryOnly: false,
                //       flagWidth: 12,
                //       showOnlyCountryWhenClosed: false,
                //       alignLeft: false,
                //     ),
                //
                //     Container(
                //       width: MediaQuery.of(context).size.width*0.64,
                //       child: TextFormField(
                //         controller: _phoneController,
                //         decoration: const InputDecoration(
                //           hintText: 'Mobile Number',
                //           suffixIcon: SizedBox(),
                //         ),
                //       ),
                //     )
                //
                //
                //   ],
                // ),



                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 60,
                    padding: const EdgeInsets.all(20),
                    child: IntlPhoneField(
                      //controller: _phoneController
                      decoration: const InputDecoration(
                        hintText: 'Mobile Number',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        counterText: '',
                      ),
                      initialCountryCode: 'IN',
                      onChanged: (phone) {
                        _phoneController.text = phone.completeNumber;
                        print(phone.completeNumber);

                      },
                      validator: (phone) {
                        if (phone == null || phone.completeNumber.isEmpty) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },


                    ),
                  ),
                ),
                const SizedBox(height: 50),
                _isLoading
                    ? const CircularProgressIndicator()
                    : GestureDetector(
                  onTap: _verifyPhoneNumber,
                  child: Container(
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        "VERIFY",
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 80),
                Text(
                  "By Continuing you agree to SoloSync CRM",
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(fontSize: 12, color: Colors.grey),
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
                        ),
                      ),
                    ),
                    Text(
                      "Privacy Policy",
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _verifyPhoneNumber() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      try {
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: _phoneController.text.toString(),
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException ex) {
            setState(() {
              _isLoading = false;
            });
            print('Verification failed: ${ex.message}');
            print(_phoneController.text);
          },
          codeSent: (String verificationId, int? resendToken) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OTPPage(verificationid: verificationId),
              ),
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        // Handle other errors
        print('Error verifying phone number: $e');
      }
    }
  }
}
