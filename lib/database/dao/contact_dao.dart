import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/components/contact_new.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {
  static const String dataBase = 'bytebank.db';

  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  static const String tableCreate =
      'CREATE TABLE $_tableName($_id INTEGER PRIMARY KEY, $_name TEXT, $_accountNumber INTEGER)';

  List<Contact_new> _toList(List<Map<String, dynamic>> result) {
    final List<Contact_new> contacts = [];

    for (Map<String, dynamic> row in result) {
      final Contact_new contact = Contact_new(
        id: row[_id],
        name: row[_name],
        accountNumber: row[_accountNumber],
      );
      contacts.add(contact);
    }

    return contacts;
  }

  Map<String, dynamic> _toMap(Contact_new contact) {
    final Map<String, dynamic> contactMap = Map();

    contactMap[_name] = contact.name;
    contactMap[_accountNumber] = contact.accountNumber;
    return contactMap;
  }

  Future<int> save(Contact_new contact) async {
    final Database db = await createDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);

    return db.insert(_tableName, contactMap);

    // return createDatabase().then((db) {
    //   final Map<String, dynamic> contactMap = Map();
    //   contactMap['name'] = contact.name;
    //   contactMap['account_number'] = contact.accountNumber;

    //   return db.insert('contacts', contactMap);
    // });
  }

  Future<List<Contact_new>> findAll() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    return _toList(result);

    // return createDatabase().then((db) {
    //   return db.query('contacts').then((maps) {
    //     final List<Contact_new> contacts = [];
    //     for (Map<String, dynamic> map in maps) {
    //       final Contact_new contact = Contact_new(
    //         id: map['id'],
    //         name: map['name'],
    //         accountNumber: map['account_number'],
    //       );
    //       contacts.add(contact);
    //     }
    //     return contacts;
    //   });
    // });
  }
}
