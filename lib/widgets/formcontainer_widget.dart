
import 'package:flutter/material.dart';


class FormContainerWidget extends StatefulWidget {
//dol constructors
  final TextEditingController? controller; // manage text input
  final Key? fieldKey; // uniquely identify widget
  final bool? isPasswordField; // a flag to indicate law password required
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved; // call back when field is saved
  final FormFieldValidator<String>? validator; // callback to validate input
  final ValueChanged<String>? onFieldSubmitted; // callback lama user y submit the field
  final TextInputType? inputType; //specifiy type of input text wla file

  const FormContainerWidget({super.key,
    this.controller,
    this.isPasswordField,
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.inputType
  });

  @override
  _FormContainerWidgetState createState() =>   _FormContainerWidgetState();
}

class _FormContainerWidgetState extends State<FormContainerWidget> {

  // da by determine law password yeb2 hidden wla visible
  bool _obscureText = true;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.35),
        borderRadius: BorderRadius.circular(10),
      ),
      // TextFormField ...> MAIN INPUT FIELD
      child:  TextFormField(
        style: const TextStyle(color: Colors.black),
        controller: widget.controller, // bykhly input binded ll controller
        keyboardType: widget.inputType, // define type of keyboard ye3mlo show
        key: widget.fieldKey,
        obscureText: widget.isPasswordField == true? _obscureText : false, //hide text law password
        onSaved: widget.onSaved,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration:  InputDecoration(
          border: InputBorder.none,
          filled: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.black45),
          suffixIcon:  GestureDetector(
            // TAP GESTURE B TOGGLE VISIBILITY OF PASSWORD
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child:
            widget.isPasswordField==true? Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: _obscureText == false ? Colors.blue : Colors.grey,) : Text(""),
          ),
        ),
      ),
    );
  }
}