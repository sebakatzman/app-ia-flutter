import 'package:flutter/material.dart';

class AiTextMessage extends StatelessWidget {
  final String message;

  const AiTextMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
          color: Color.fromRGBO(242, 244, 245, 1),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(24),
              topRight: Radius.circular(24),
              bottomLeft: Radius.circular(24))),
      child: Text(
        message,
        style:
            const TextStyle(color: Color.fromRGBO(48, 52, 55, 1), fontSize: 15),
        textAlign: TextAlign.left,
      ),
    );
  }
}
