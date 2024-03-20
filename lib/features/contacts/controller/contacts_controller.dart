import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/features/contacts/repository/contacts_repository.dart';

final getContactsProvider = FutureProvider((ref) {
  final contactsRepository = ref.watch(contactsRepositoryProvider);
  return contactsRepository.getContacts();
});

final contactsControllerProvider = Provider((ref) {
  final contactsRepository = ref.watch(contactsRepositoryProvider);
  return ContactsController(contactsRepository: contactsRepository, ref: ref);
});

class ContactsController {
  ContactsController({required this.contactsRepository, required this.ref});

  final ContactsRepository contactsRepository;
  final ProviderRef ref;

  void selectContact(Contact selectedContact, BuildContext context) {
    contactsRepository.selectContact(selectedContact, context);
  }
}
