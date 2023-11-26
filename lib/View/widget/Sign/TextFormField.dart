import 'package:flutter/material.dart';
import 'package:restaurantapp/core/const/color.dart';

class TextFormFields extends StatelessWidget {
  TextFormFields(
      {Key? key,
      this.validator,
      required this.isNum,
      required this.hint,
      this.lable,
      required this.icons, this.controllerText,
      this.icons2,
      this.press,
      this.onTapIcon})
      : super(key: key);
  String? lable, hint;
  bool? press;
  Icon icons;
  Icon? icons2;
  bool isNum;
  Function()? onTapIcon;
  TextEditingController? controllerText;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        keyboardType:
            (isNum == true) ? TextInputType.phone : TextInputType.text,
        validator: validator,
        controller: controllerText,
        obscureText: press == null || press == false ? false : true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                BorderSide(color: colorApp.primary), // Change color here
          ),
          labelText: lable,
          labelStyle: TextStyle(color: colorApp.primary),
          hintText: hint,
          suffixIcon: InkWell(
            child: press == null || press == false ? icons : icons2,
            onTap: onTapIcon,
          ),
          suffixIconColor: colorApp.primary,
          focusColor: colorApp.primary,
          fillColor: colorApp.primary,
          hoverColor: colorApp.primary,
        ),
      ),
    );
  }
}
