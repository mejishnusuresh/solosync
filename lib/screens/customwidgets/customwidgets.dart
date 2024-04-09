import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatefulWidget {
  final bool enabled;
  final String hindText;
  final IconData? icon;
  final TextInputType inputType;
  final int maxLines;
  final TextEditingController controller;

  const CustomTextFormField({
    Key? key,
    required this.enabled,
    required this.hindText,
    this.icon,
    required this.inputType,
    required this.maxLines,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      cursorColor: Theme.of(context).primaryColor,
      controller: widget.controller,
      keyboardType: widget.inputType,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        prefixIcon: widget.icon != null
            ? Icon(widget.icon, color: Theme.of(context).primaryColor)
            : null,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        hintText: widget.hindText,
        alignLabelWithHint: true,
        border: InputBorder.none,
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
          return "Please enter ${widget.hindText}";
        }
        return null;
      },
    );
  }
}
