import 'dart:io';
import 'package:yaml/yaml.dart';

class ParamValidation {
  //get all of the information from the parameters.yaml file to be used in the program
  Map<dynamic, dynamic> yamlDetails(yamlFile) {
    stdout.writeln("-------Starting Parameter Checks-------");
    File file = File(yamlFile);
    String yamlString = file.readAsStringSync();
    Map yaml = loadYaml(yamlString);
    return (yaml);
  }

  //validate all of the input to make sure the required fields are filled in correctly
  List yamlValidation(yaml) {
    List res = [];
    if (yaml['email'] == null) {
      res.add("Email is missing");
    }
    if (yaml['password'] == null) {
      res.add("Password is missing");
    }

    return res;
  }
}
