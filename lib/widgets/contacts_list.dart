import 'package:flutter/material.dart';
import 'package:whatsapp_clone/info.dart';
import 'package:whatsapp_clone/screens/mobile_chat_screen.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: info.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MobileChatScreen(
                    name: info[index]['name'].toString(),
                    imageUrl: info[index]['profilePic'].toString(),
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: ListTile(
                title: Text(
                  info[index]['name'].toString(),
                  style: const TextStyle(fontSize: 18),
                ),
                subtitle: Text(
                  overflow: TextOverflow.ellipsis,
                  info[index]['message'].toString(),
                  style: const TextStyle(fontSize: 15),
                ),
                leading: CircleAvatar(
                  radius: 23,
                  backgroundImage:
                      NetworkImage(info[index]['profilePic'].toString()),
                ),
                trailing: Text(
                  info[index]['time'].toString(),
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
