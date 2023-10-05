import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      required this.txtcontroller,
      required this.text,
      this.fontSize,
      this.hintStyle,
      this.isObscure,
      this.dataValidator,
      this.textInputType,
      required this.prefixIcon,
      this.textInputFormatter});
  TextEditingController txtcontroller;
  String text;
  bool? isObscure;
  IconData? suffixicon;
  TextStyle? hintStyle;
  Icon prefixIcon;
  double? fontSize;

  TextInputType? textInputType;
  String? Function(String?)? dataValidator;

  List<TextInputFormatter>? textInputFormatter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        8.h,
      ),
      child: TextFormField(
        inputFormatters: textInputFormatter,
        style: GoogleFonts.montserrat(
            fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black),
        validator: dataValidator,
        controller: txtcontroller,
        keyboardType: textInputType,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          // isDense: true,
          errorStyle: GoogleFonts.montserrat(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
          ),
          prefixIconConstraints: const BoxConstraints(),
          prefixIcon: prefixIcon,

          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF618264)),
          ),
          disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF79AC78)),
          ),
          hintText: text,
          hintStyle: GoogleFonts.montserrat(
            fontSize: fontSize ?? 14.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF5D5D5C),
          ),
          floatingLabelAlignment: FloatingLabelAlignment.center,
        ),
      ),
    );
  }
}
