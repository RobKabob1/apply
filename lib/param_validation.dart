import 'dart:io';
import 'package:yaml/yaml.dart';

class ParamValidation {
  Map<dynamic, dynamic> yamlDetails() {
    File file = File('parameters.yaml');
    String yamlString = file.readAsStringSync();
    Map yaml = loadYaml(yamlString);
    return (yaml);
  }
}
