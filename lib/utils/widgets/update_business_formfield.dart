
import 'package:flutter/material.dart';

class UpdateBusinessFormField extends StatefulWidget {
   const UpdateBusinessFormField({
    Key? key,
    required this.onChanged,
    required this.error,
    required this.hasError,
    required this.label,
    required this.hintText,
    required this.value,
  }) : super(key: key);

  final void Function(String inputValue) onChanged;
  final String error;
  final bool hasError;
  final String label;
  final String hintText;
  final String value;

  @override
  State<UpdateBusinessFormField> createState() => _UpdateBusinessFormFieldState();
}

class _UpdateBusinessFormFieldState extends State<UpdateBusinessFormField> {
  final TextEditingController tController = TextEditingController();
  @override
  void initState() {
    tController.text = widget.value;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Text(widget.label),
          TextField(
            controller: tController,
            onChanged: widget.onChanged,
            decoration:  InputDecoration(
              hintText: widget.hintText,
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              )
            ),
          ),
          //ErrorWidget
          widget.hasError ?
          Text(
            widget.error,
            style: const TextStyle(color: Colors.red),
          ) : const SizedBox(height: 20,),
        ],
      ),
    );
  }
}