import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  CustomButton({super.key, required this.text, required this.onTap});
  final String text;
  final void Function() onTap;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 204, 45, 32),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            widget.text.toUpperCase(),
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
