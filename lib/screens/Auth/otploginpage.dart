import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:solosync/screens/Auth/successpage.dart';

class OTPLoginPage extends StatefulWidget {
  const OTPLoginPage({super.key});

  @override
  State<OTPLoginPage> createState() => _OTPLoginPageState();
}

class _OTPLoginPageState extends State<OTPLoginPage> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void initState() {
    super.initState();
    _listenForOTP();
  }

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    _focusNodes.forEach((focusNode) => focusNode.dispose());
    super.dispose();
  }

  void _listenForOTP() async {
    await SmsAutoFill().listenForCode;
    SmsAutoFill().code.listen((event) {
      if (event.isNotEmpty) {
        for (int i = 0; i < event.length && i < _controllers.length; i++) {
          _controllers[i].text = event[i];
          if (i < _controllers.length - 1) {
            FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
          } else {
            // Automatically verify OTP when all digits are entered
            _verifyOTP();
          }
        }
      }
    });
  }

  void _verifyOTP() {
    String dummyOTP = '123456'; // Replace this with your actual OTP
    String otp = _controllers.map((controller) => controller.text).join();
    if (otp == dummyOTP) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SuccessPage()),
      );
    } else {
      // Handle incorrect OTP
      print('Incorrect OTP entered');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Enter Verification Code',
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold))),
            Text('We are automatically detecting a SMS',
                style: GoogleFonts.inter(
                    textStyle:
                        const TextStyle(fontSize: 16, color: Colors.grey))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('send to your mobile number ',
                    style: GoogleFonts.inter(
                        textStyle:
                            const TextStyle(fontSize: 16, color: Colors.grey))),
                Text('**********',
                    style: GoogleFonts.inter(
                        textStyle:
                            const TextStyle(fontSize: 16, color: Colors.grey))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                    List.generate(6, (index) => _buildOTPTextField(index)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Don't receive the code? ",
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontSize: 14, color: Colors.grey))),
                      TextSpan(
                        text: "Resent OTP",
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).primaryColor,
                        )),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _showResentCode(context);
                          },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOTPTextField(int index) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextFormField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: _controllers[index].text.isNotEmpty
              ? Theme.of(context).primaryColor
              : Theme.of(context).primaryColor.withOpacity(0.2),
          counterText: '',
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
          hintStyle: TextStyle(
            color: _controllers[index].text.isNotEmpty
                ? Colors.white
                : Theme.of(context).primaryColor,
          ),
          hintMaxLines: 1,
          hintText:
              _controllers[index].text.isEmpty ? '' : _controllers[index].text,
        ),
        onChanged: (value) {
          if (value.isEmpty) {
            if (index > 0) {
              FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
            }
          } else {
            // Move focus to the next field
            if (index < 5) {
              FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
            } else {
              _verifyOTP();
            }
          }
          setState(() {});
        },
      ),
    );
  }

  void _showResentCode(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40)),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: const Icon(
                          Icons.message_rounded,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Didn't receive a verification code?",
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        )),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Please check your SMS messages before requesting another code.",
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        )),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 300,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.message_rounded,
                                  color: Theme.of(context).primaryColor,
                                  size: 14,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Resend SMS",
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                )),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
