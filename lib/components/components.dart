import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loanapp/utils/constants.dart';
import 'package:loanapp/utils/size_config.dart';

Widget regularText(
    String title, double size, Color color, FontWeight fontWeight, align) {
  return Text(
    title,
    overflow: TextOverflow.ellipsis,
    textAlign: (align == 0)
        ? TextAlign.left
        : (align == 1)
            ? TextAlign.center
            : TextAlign.right,
    maxLines: 3,
    style: GoogleFonts.nunito(
      textStyle: TextStyle(
        color: color,
        fontSize: SizeConfig.textMultiplier * size,
        fontWeight: fontWeight,
      ),
    ),
  );
}

Widget customField(contrller, label, icon, textInputType) {
  return TextFormField(
    controller: contrller,
    readOnly: (label == "Monthly Installment") ? true : false,
    validator: RequiredValidator(
      errorText: 'This field is required',
    ),
    keyboardType: textInputType,
    decoration: InputDecoration(
      hintText: label,
      fillColor: Colors.white,
      filled: true,
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      suffixIcon: Container(
        padding: EdgeInsets.all(SizeConfig.heightMultiplier),
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Icon(icon),
      ),
    ),
  );
}

Widget space3() {
  return SizedBox(
    height: SizeConfig.heightMultiplier * 10,
  );
}

Widget space1() {
  return SizedBox(
    height: SizeConfig.heightMultiplier * 2,
  );
}
