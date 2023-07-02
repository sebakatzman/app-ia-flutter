import 'package:flutter/material.dart';

class UserTextMessage extends StatelessWidget {
  final String message;

  const UserTextMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
          color: Color.fromRGBO(0, 112, 240, 1),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
              bottomLeft: Radius.circular(24))),
      child: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 15),
        textAlign: TextAlign.right,
      ),
    );
  }
}
