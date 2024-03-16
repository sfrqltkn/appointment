import 'package:flutter/material.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});
  static const String routeName = "/chat_page";

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beauty"),
      ),
      body: const Center(
        child: Column(
          children: [
            Text("CHATBOT"),
          ],
        ),
      ),
    );
  }
}
