import 'dart:io';
import 'package:supabase/supabase.dart';

class DatabaseSetup {
  Future<String> initializeData(client, key, email) async {
    //initialize Supabase
    String res = "";
    try {
      //create a user in users table if it doesn't already exist
      final supabase = SupabaseClient(client, key);
      final data = await supabase.from('users').select('id').eq('email', email);

      if (data.isEmpty) {
        try {
          await supabase.from('users').insert([
            {'email': 'test'}
          ]);
          stdout.writeln("Created $email user");
        } catch (e) {
          res = e.toString();
        }
      } else {
        stdout.writeln("User $email exists");
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
