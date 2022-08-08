
import 'package:flutter/material.dart';

class BusinessFormField extends StatelessWidget {
   const BusinessFormField({
    Key? key,
    required this.onChanged,
    required this.error,
    required this.hasError,
    required this.label,
    required this.hintText,
  }) : super(key: key);

  final void Function(String inputValue) onChanged;
  final String error;
  final bool hasError;
  final String label;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Text(label),
          TextField(
            onChanged: onChanged,
            decoration:  InputDecoration(
              hintText: hintText,
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              )
            ),
          ),
          //ErrorWidget
          hasError ?
          Text(
            error,
            style: const TextStyle(color: Colors.red),
          ) : const SizedBox(height: 20,),
        ],
      ),
    );
  }
}