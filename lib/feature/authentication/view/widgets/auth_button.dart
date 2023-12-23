import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.text,
    required this.onTap,
    this.wdth,
  });
  final String text;
  final VoidCallback onTap;
  final double? wdth;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: wdth ?? 150,
        height: 45,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(9),
          ),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(6, 199, 172, 1),
              Color.fromRGBO(6, 199, 172, 1),
              Color.fromRGBO(6, 199, 172, .34),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
