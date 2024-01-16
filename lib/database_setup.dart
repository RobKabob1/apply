import 'dart:io';
import 'package:supabase/supabase.dart';

class DatabaseSetup {
  Future<Map<String, dynamic>> initializeData(
      client, key, email, jobTitles, jobLocations) async {
    stdout.writeln("-------Starting Database Checks-------");

    //initialize Supabase
    try {
      //create a user in users table if it doesn't already exist
      final supabase = SupabaseClient(client, key);
      final data = await supabase.from('users').select().eq('email', email);

      if (data.isEmpty) {
        try {
          await supabase.from('users').insert([
            {
              'email': email,
              'jobTitles': jobTitles,
              'jobLocations': jobLocations,
            }
          ]);
          //get job titles and locations for new user
          stdout.writeln("Created $email user");
          return data.first;
        } catch (e) {
          stderr.writeln('Database Error: ${e.toString()}');
          exit(2);
        }
      } else {
        stdout.writeln("User $email exists");
        return data.first;
      }
    } catch (e) {
      stderr.writeln('Database Error: ${e.toString()}');
      exit(2);
    }
  }
}
