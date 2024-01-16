import 'dart:io';

import 'package:apply/database_setup.dart';
import 'package:apply/param_validation.dart';

Future<void> main(List<String> arguments) async {
  //get the parameters for the script from the parameters.yaml file
  Map<dynamic, dynamic> yamlResults =
      ParamValidation().yamlDetails('parameters.yaml');
  List res = ParamValidation().yamlValidation(yamlResults);

  //print all of the errors on yaml validation
  if (res.isNotEmpty) {
    int errorCount = 0;
    for (String error in res) {
      errorCount += 1;
      stderr.writeln('Error #$errorCount: $error');
    }
    exit(2);
  }

  //call the database
  await DatabaseSetup()
      .initializeData(
    yamlResults['supabaseURL'],
    yamlResults['supabaseKey'],
    yamlResults['email'],
  )
      .then(
    (value) {
      if (value != "") {
        stderr.writeln('Database Error: $value');
        exit(2);
      }
    },
  );

  //end the program
  exit(0);
}
