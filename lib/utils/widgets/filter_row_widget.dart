import 'package:flutter/material.dart';

import 'custom_elevated_button.dart';

class FilterRowWidget extends StatelessWidget {
  final String leadingText;
  final String value;
  final void Function() buttonPressed;
  final void Function(String value) returnData;
  const FilterRowWidget({
    required this.leadingText,
    required this.value,
    required this.buttonPressed,
    required this.returnData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          CustomElevatedButton(
            text: leadingText,
            width: 95,
            buttonPressed: (){},
            isPressEnable: false,
            ),
          const SizedBox(width: 5,),
           Expanded(
            child: InkWell(
              onTap: buttonPressed,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black,)
                  )
                ),
                child: Text(value,style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
