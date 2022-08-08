import 'package:flutter/material.dart';

class BusinessFilterForm extends StatelessWidget {
  final String label;
  final String value;
  final void Function() buttonPressed;
  final bool hasError;
  final String error;
  const BusinessFilterForm({
    required this.label,
    required this.value,
    required this.buttonPressed,
    required this.hasError,
    required this.error,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonPressed,
      child: SizedBox(
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label),
            const SizedBox(height: 5,),
             Text(value,style: const TextStyle(
                    
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              
            const Divider(color: Colors.black45,thickness: 1),
             hasError ?
            Text(
              error,
              style: const TextStyle(color: Colors.red),
            ) : const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
