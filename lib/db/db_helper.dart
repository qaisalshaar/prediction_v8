import 'dart:math';

import 'package:dagnosis_and_prediction/model/location_model.dart';
import 'package:dagnosis_and_prediction/model/registration_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = 'registration';
  static const String _tableName1 = 'userlocation';
  static Future<void> initDb() async {
    if (_db != null) {
      debugPrint('not null db');
      return;
    } else {
      try {
        String _path = await getDatabasesPath() + 'localDB.db';
        debugPrint('in Data base');
        debugPrint(_path);
        _db = await openDatabase(_path, version: _version,
            onCreate: (Database db, int version) async {
          debugPrint('in Data base');
          // When creating the db, create the table
          await db.execute('''
            CREATE TABLE $_tableName (
            id INTEGER PRIMARY KEY autoincrement,
            firstName TEXT,
            secondName TEXT,
            nikeName TEXT,
            email TEXT,
            password TEXT,
            highbloodpressure INTEGER, 
            lowerbloodpressure INTEGER, 
            gender TEXT,
            birthdate TEXT,
            weight INTEGER, 
            height INTEGER, 
            cholesterol INTEGER, 
            medicine TEXT,
            diabetesinfamily TEXT,
            latitude TEXT,
            longitude TEXT
            )
''');
          await db.execute('''
            CREATE TABLE $_tableName1 (
            id INTEGER PRIMARY KEY autoincrement,
            cityName TEXT,
            districtName TEXT,
            streetName TEXT,
            houseName TEXT
            )
''');
        });
        debugPrint('Database Creeated');
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

// Insert Into Database
  static Future<int> insert(Registration registration) async {
    debugPrint("insert");
    String? email = registration.email;
    // Check Email is Exist
    var emailExist =
        await _db?.rawQuery("SELECT * FROM $_tableName WHERE email = '$email'");

    // ignore: prefer_is_empty
    if (emailExist!.length == 0) {
      return await _db!.insert(_tableName, registration.toJson());
      ;
    } else {
      return 0;
    }
  }

// Insert By Line By query
  static insert2() async {
    debugPrint("insert2");
    await _db!.rawInsert(
        "INSERT INTO $_tableName (firstName) VALUES ('AHMED SSSSSSS') ");
    List<Map<String, Object?>>? response =
        await _db?.rawQuery('SELECT * FROM $_tableName');
    print(response);
  }
//  static inserttolocation(Location location) async {
//     debugPrint("insertto location");
//     await _db!.rawInsert(
//         "INSERT INTO Userlocation (cityName,districtName,) VALUES ('AHMED SSSSSSS') ");
//     List<Map<String, Object?>>? response =
//         await _db?.rawQuery('SELECT * FROM $_tableName');
//     print(response);
//   }

//  static Future<int> inserttolocation(Location location) async {
//     debugPrint("insertto location");
//     // String? email = registration.email;
//     // Check Email is Exist

//     // ignore: prefer_is_empty

//       return await _db!.inserttolocation(_tableName1, location.toJson());

//     }
//   }

// Delete By Email Address
  static Future<int> deleteRow(Registration? registration) async {
    debugPrint("delete");
    return await _db!
        .delete(_tableName, where: 'id = ?', whereArgs: [registration!.email]);
  }

// Delete All Rows In Database
  static Future<int> deleteAllDBRows() async {
    debugPrint("delete All Rows DB ROWS");
    return await _db!.delete(_tableName);
  }

// Ubdate Database By Email
  static Future<int> update(String? email) async {
    debugPrint("update");
    return await _db!.rawUpdate('''
      UPDATE $_tableName
      SET isCompleted = ?
      WHERE id = ?
''', [1, email]);
  }

// Query by Table Name -- Read Data
  static Future<List<Map<String, dynamic>>> query() async {
    debugPrint("Query");
    print(_db!.query(_tableName));
    List<Map<String, Object?>>? response =
        await _db?.rawQuery('SELECT * FROM $_tableName');
    print(response);
    return await _db!.query(_tableName);
  }

  // User Login
  static Future<Registration?> getLogin(String email, String password) async {
    try {
      var res = await _db?.rawQuery(
          "SELECT * FROM $_tableName WHERE email = '$email' and password = '$password'");

      if (res?.isNotEmpty == true) {
        Registration userdata = Registration.fromMap(res!.first);
        // query();
        debugPrint('ssssssssssss ${userdata.firstName}');
        return userdata;
      }
      print("Not Exist");
      return null;
    } catch (e) {
      print(e.toString());
    }
  }

// User Login
  // ignore: body_might_complete_normally_nullable
  static Future<Registration?> getuserLocation(String email) async {
    try {
      var res = await _db
          ?.rawQuery("SELECT * FROM $_tableName WHERE email = '$email'");

      if (res?.isNotEmpty == true) {
        Registration userdata = Registration.fromMap(res!.first);
        // query();
        debugPrint('ssssssssssss ${userdata.firstName}');
        return userdata;
      }
      print("Not Exist");
    } catch (e) {
      print(e.toString());
    }
  }
  // Login method return list of Users
  // static Future<List<Map<String, dynamic>>?> getLogin(
  //     String email, String password) async {
  //   debugPrint(email);
  //   var res = await _db?.rawQuery(
  //       "SELECT * FROM $_tableName WHERE email = '$email' and password = '$password'");

  //   if (res != null) {
  //     print(res);
  //     return res;
  //   }
  //   print(res);
  //   return null;
  // }

// Query by Table Name -- Read Data
  static Future<List<Map<String, dynamic>>> query2() async {
    debugPrint("Query");
    print(_db!.query(_tableName));
    return await _db!.query(_tableName);
  }

// Close Database
  static closeDb() async {
    await _db!.close();
  }
}
