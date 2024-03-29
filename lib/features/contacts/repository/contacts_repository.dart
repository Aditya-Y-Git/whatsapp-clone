import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/common/utils/utils.dart';
import 'package:whatsapp_clone/models/user_model.dart';
import 'package:whatsapp_clone/screens/mobile_chat_screen.dart';

final contactsRepositoryProvider = Provider(
  (ref) => ContactsRepository(firestore: FirebaseFirestore.instance),
);

class ContactsRepository {
  ContactsRepository({required this.firestore});

  final FirebaseFirestore firestore;

  Future<List<Contact>> getContacts() async {
    List<Contact> contacts = [];
    try {
      if (await FlutterContacts.requestPermission()) {
        contacts = await FlutterContacts.getContacts(withProperties: true);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return contacts;
  }

  void selectContact(Contact selectedContact, BuildContext context) async {
    try {
      var userCollection = await firestore.collection('users').get();
      bool isFound = false;

      for (var document in userCollection.docs) {
        var userData = UserModel.fromJson(document.data());

        if (userData.phoneNumber ==
            selectedContact.phones[0].normalizedNumber) {
          isFound = true;
          break;
        }
      }
      if (isFound) {
        if (!context.mounted) {
          return;
        }
        Map<String, dynamic> arguments = {
          'name': selectedContact.displayName,
          'imageUrl': selectedContact.photo.toString(),
        };
        Navigator.pushNamed(context, MobileChatScreen.routeName,
            arguments: arguments);
        ScaffoldMessenger.of(context).clearSnackBars();
      } else {
        if (!context.mounted) {
          return;
        }
        showSnackBar(
            context: context,
            content:
                '${selectedContact.displayName} is not registered on this app');
      }
    } catch (e) {
      if (!context.mounted) return;
      showSnackBar(context: context, content: e.toString());
    }
  }
}
