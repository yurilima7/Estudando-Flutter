import 'package:flutter/material.dart';
import 'package:sqlite_exemplo/database/database_sqlite.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _database();
  }

  void _database() async {
    final database = await DatabaseSqLite().openConnection();

    // database.rawInsert('insert into teste values(null, ?)', ['Yuri Lima']);
    // database.rawUpdate('update teste set nome = ? where id = ?', ['Yuri Lima', 1]);
    // database.rawDelete('delete from teste where id = ?', [1]);
    var result = await database.query('select * from teste');
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'), 
      ),
      body: Container(),
    );
  }
}
