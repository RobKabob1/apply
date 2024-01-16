import 'dart:io';
import 'dart:math';

class ApplyTo {
  void applytothings(Map<String, dynamic> clientInformation) {
    stdout.writeln("-------Starting Applications-------");

    //being running through random job titles and job locations
    final random = Random();
    while (true) {
      var randomTitle = clientInformation['jobTitles']
          [random.nextInt(clientInformation['jobTitles'].length)];
      var randomLocation = clientInformation['jobLocations']
          [random.nextInt(clientInformation['jobLocations'].length)];

      stdout.writeln(
          "Starting applications for $randomTitle located in $randomLocation");
    }
  }
}
