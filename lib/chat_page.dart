import 'package:app_demo/data/ia_response.dart';
import 'package:app_demo/services/analytics_service.dart';
import 'package:app_demo/services/ia_service.dart';
import 'package:app_demo/widgets/ai_text_message.dart';
import 'package:app_demo/widgets/user_text_message.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<TextMessage> messages = [];

  TextEditingController textFieldController = TextEditingController();

  ScaffoldMessengerState? scaffoldMsgState;

  void sendUserMsgToAI(userMessage) async {
    IaResponse chatBotRes = await sendQuestionToChatbot(userMessage);

    if (chatBotRes.error && scaffoldMsgState != null) {
      scaffoldMsgState?.showSnackBar(SnackBar(
        content: const Text("Error al enviar el mensaje"),
        backgroundColor: Colors.red.shade400,
      ));
    } else {
      incrementTextResponsesCount();
    }

    setState(() {
      messages.add(TextMessage(chatBotRes.mensaje, false));
    });
  }

  void addUserMessage(String message) {
    setState(() {
      messages.add(TextMessage(message, true));
    });
    sendUserMsgToAI(message);
  }

  @override
  Widget build(BuildContext context) {
    scaffoldMsgState = ScaffoldMessenger.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(242, 248, 255, 1),
                  borderRadius: BorderRadius.circular(50)),
              child: const Icon(Icons.android,
                  size: 24, color: Color.fromRGBO(0, 112, 240, 1)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Canal de texto",
                    style: TextStyle(
                        color: Color.fromRGBO(32, 35, 37, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
                Row(
                  children: [
                    Container(
                        width: 10,
                        height: 10,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(125, 222, 134, 1),
                            borderRadius: BorderRadius.circular(50))),
                    const Text(
                      "Siempre activo",
                      style: TextStyle(
                          color: Color.fromRGBO(114, 119, 122, 1),
                          fontSize: 14),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          color: const Color.fromRGBO(254, 254, 254, 1),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: messages
                      .map((txtMsg) => txtMsg.isUser
                          ? UserTextMessage(message: txtMsg.text)
                          : AiTextMessage(message: txtMsg.text))
                      .toList(),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 12),
                child: Row(children: [
                  Expanded(
                    child: TextField(
                      controller: textFieldController,
                      onSubmitted: (value) {
                        addUserMessage(value);
                        textFieldController.clear();
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        labelText: 'escribe un mensaje...',
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(48, 52, 55, 1),
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                        onPressed: () {
                          addUserMessage(textFieldController.text);
                          textFieldController.clear();
                        },
                        icon: const Icon(Icons.send),
                        color: Colors.white,
                      ))
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextMessage {
  final String text;
  final bool isUser;

  TextMessage(this.text, this.isUser);
}
