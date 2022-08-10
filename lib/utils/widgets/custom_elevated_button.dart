
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.text,
    this.width,
    this.height,
    required this.buttonPressed,
    this.elevation,
    this.isPressEnable = true,
    this.color = Colors.black,
  }) : super(key: key);

  final String text;
  final double? width;
  final double? height;
  final void Function() buttonPressed;
  final double? elevation;
  final bool? isPressEnable;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(),
          primary: color,
          elevation: elevation ?? 0,
        ),
        onPressed: isPressEnable! ? buttonPressed : (){}, child:  Text(
        text ,style: const TextStyle(color: Colors.white,)
      )),
    );
  }
}