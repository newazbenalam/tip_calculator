import 'package:flutter/material.dart';
import 'package:tip_calculator/constant.dart';

class TextFieldDouble extends StatefulWidget {
  TextFieldDouble(
      {super.key,
      required this.title,
      required this.textInputController,
      this.iconData});
  final Icon? iconData;
  final TextEditingController textInputController;
  final GlobalKey fieldKey = GlobalKey();
  final String title;

  @override
  State<TextFieldDouble> createState() => _TextFieldDoubleState();
}

class _TextFieldDoubleState extends State<TextFieldDouble> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textInputController,
      key: widget.fieldKey,
      keyboardType: TextInputType.number,
      // autofocus: true,
      decoration: InputDecoration(
        hintText: widget.title,
        hintStyle: const TextStyle(color: textLightBlack, fontSize: 14),
        suffixIcon: widget.iconData ?? Text(""),
        filled: true,
        fillColor: containerColor,
        iconColor: textLightBlack,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0,
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0,
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0,
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onChanged: (value) {
        widget.textInputController.text = value.toString();
        widget.textInputController.selection = TextSelection.fromPosition(
            TextPosition(offset: widget.textInputController.text.length));
      },
      // onSaved: (value) {
      //   setState(() {
      //     widget.textInputController.text = value.toString();
      //     // widget.variable = double.parse(widget.textInputController.text);
      //     debugPrint(widget.textInputController.text);
      //   });
      // },
      onEditingComplete: () {
        setState(() {
          // widget.variable = double.parse(widget.textInputController.text);
          debugPrint(widget.textInputController.text);
        });
      },
    );
  }
}
