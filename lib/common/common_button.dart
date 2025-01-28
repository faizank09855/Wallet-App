import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String title ;
  final Function() onPress;
  const CommonButton({super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(

          style: FilledButton.styleFrom(
            animationDuration: Duration(seconds: 1),
              splashFactory: InkRipple.splashFactory,
              padding: EdgeInsets.symmetric(vertical: 16 , horizontal: 20),
              backgroundColor: Colors.indigo  , shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          onPressed: onPress, child: Text(title)),
    );
  }
}
