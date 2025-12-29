// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class OutlinedTextField extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final int? maxLines;
  final int? minLines;

  String? initialValue;
  OutlinedTextField({
    Key? key,
    required this.label,
    required this.placeholder,
    required this.controller,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.maxLines,
    this.minLines,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      maxLines: maxLines ?? 1,
      minLines: maxLines ?? 1,
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: TextStyle(fontSize: 14),
        //hintText: placeholder,
        border: OutlineInputBorder(),
      ),
    );
  }
}
