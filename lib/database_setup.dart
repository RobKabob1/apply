import 'package:supabase/supabase.dart';

class DatabaseSetup {
  Future<String> initializeData(client, key, email) async {
    //initialize Supabase
    String res = "";
    try {
      //see if there is a table named your email
      final supabase = SupabaseClient(client, key);
      final data = await supabase.from('information_schema.tables').select('*');
      print(data);
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
