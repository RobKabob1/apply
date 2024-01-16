import 'dart:io';
import 'dart:math';

import 'package:puppeteer/puppeteer.dart';

class Application {
  //function to login to site
  Future<String> login(
    Browser browser,
    email,
    password,
  ) async {
    String res = "";

    try {
      // Open a new tab to LinkedIn
      var myPage = await browser.newPage();

      // Go to LinkedIn and login
      await myPage.goto('https://www.linkedin.com/login', wait: Until.load);
      await wait("login");
      await myPage.focus('#username');
      await myPage.keyboard.type(email);
      await wait("login");
      await myPage.focus('#password');
      await myPage.keyboard.type(password);
      await wait("login");
      await myPage
          .click("Button[class='btn__primary--large from__button--floating']");

      //check for security check
      String? pageURL = myPage.url;
      if (pageURL.toString().contains('checkpoint/challenge') ||
          pageURL.toString().contains('security check')) {
        stdout.writeln("Finish the security check. Waiting 30-40 seconds...");
        await wait("security");
      }

      // Gracefully close the browser's process
      await wait("close");
      await browser.close();
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  //function to build in randomized wait times after events
  Future<void> wait(section) async {
    if (section == "login") {
      int time = Random().nextInt(2) + 2; //value is 2-3
      await Future.delayed(Duration(seconds: time), () {});
    }
    if (section == "security") {
      int time = Random().nextInt(10) + 30; //value is 30-40
      await Future.delayed(Duration(seconds: time), () {});
    }
    if (section == "close") {
      int time = Random().nextInt(6) + 6; //value is 6-11
      await Future.delayed(Duration(seconds: time), () {});
    }
  }
}
