import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/widgets/contacts_list.dart';
import 'package:whatsapp_clone/widgets/web_chat_appbar.dart';
import 'package:whatsapp_clone/widgets/web_profile_bar.dart';
import 'package:whatsapp_clone/widgets/web_search_bar.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                WebProfileBar(),
                WebSearchBar(),
                ContactsList(),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.70,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/backgroundImage.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const WebChatAppBar(),
              const Spacer(),
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: const BoxDecoration(
                  color: dividerColor,
                ),
                child: Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.emoji_emotions_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      margin: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.008),
                      decoration: const BoxDecoration(
                        color: chatBarMessage,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.mic,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
