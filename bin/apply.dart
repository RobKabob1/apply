import 'package:apply/param_validation.dart';

void main(List<String> arguments) {
  Map<dynamic, dynamic> yamlResults = ParamValidation().yamlDetails();
  print(yamlResults);
  //to pint a single item
  //print(yamlResults['email']);
}
