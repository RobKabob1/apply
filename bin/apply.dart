import 'dart:io';

import 'package:apply/param_validation.dart';

void main(List<String> arguments) {
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
}
