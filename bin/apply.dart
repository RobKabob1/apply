import 'dart:io';

import 'package:apply/apply_to.dart';
import 'package:apply/login_security_checks.dart';
import 'package:apply/database_setup.dart';
import 'package:apply/param_validation.dart';
import 'package:puppeteer/puppeteer.dart';

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
  var clientInformation = await DatabaseSetup().initializeData(
    yamlResults['supabaseURL'],
    yamlResults['supabaseKey'],
    yamlResults['email'],
    yamlResults['jobTitles'],
    yamlResults['jobLocations'],
  );

  //launch web browser
  Browser browser;
  try {
    browser = await puppeteer.launch(
      headless: false,
      noSandboxFlag: true,
      executablePath: '/usr/bin/google-chrome-stable',
    );
  } catch (e) {
    stderr.writeln('Browser Error: ${e.toString}');
    exit(2);
  }

  //go to webpage
  await LoginSecurityChecks()
      .login(
    browser,
    yamlResults['email'],
    yamlResults['password'],
  )
      .then(
    (value) {
      if (value != "") {
        stderr.writeln('Chrome Error: $value');
        exit(2);
      }
    },
  );

  //begin applying to jobs
  ApplyTo().applytothings(clientInformation);

  //end the program
  exit(0);
}
