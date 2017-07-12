/// These are straightforward migrations.
///
/// You will likely never have to actually write these yourself.
library angel_migration.example.todo;

import 'package:angel_migration/angel_migration.dart';

class UserMigration implements Migration {
  @override
  void up(Schema schema) {
    schema.create('users', (table) {
      table
        ..serial('id').primaryKey()
        ..varchar('username', length: 32).unique()
        ..varchar('password')
        ..boolean('account_confirmed').defaultsTo(false);
    });
  }

  @override
  void down(Schema schema) {
    schema.drop('users');
  }
}

class TodoMigration implements Migration {
  @override
  void up(Schema schema) {
    schema.create('todos', (table) {
      table
        ..serial('id').primaryKey()
        ..integer('user_id').references('user', 'id').onDeleteCascade()
        ..varchar('text')
        ..boolean('completed').defaultsTo(false);
    });
  }

  @override
  void down(Schema schema) {
    schema.drop('todos');
  }
}
