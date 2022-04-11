import 'package:bytebank/components/contact_new.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');
    final String query =
        'CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, account_number INTEGER)';

    return openDatabase(path, onCreate: (db, version) {
      db.execute(query);
    }, version: 1);
  });
}

Future<int> save(Contact_new contact) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contactMap = Map();
    contactMap['id'] = contact.id;
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;

    return db.insert('contacts', contactMap);
  });
}

Future<List<Contact_new>> findAll() {
  return createDatabase().then((db) {
    return db.query('contacts').then((maps) {
      final List<Contact_new> contacts = [];
      for (Map<String, dynamic> map in maps) {
        final Contact_new contact = Contact_new(
          id: map['id'],
          name: map['name'],
          accountNumber: map['account_number'],
        );
        contacts.add(contact);
      }
      ;
      return contacts;
    });
  });
}

/*
Future<> findAll(Contact_new contact) {
  return createDatabase().then((db) {
   
  });
}
*/
