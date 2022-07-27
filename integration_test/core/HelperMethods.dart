import 'dart:io';
import 'package:flutter_test/flutter_test.dart';

class HelperMethods {
  const HelperMethods(this.tester);

  final WidgetTester tester;

  bool isElementDisplayed(String name, Finder finder, {Matcher? matcher}) {
    matcher ??= findsOneWidget;

    try {
      expect(finder, matcher);
      print("$name is displayed - Pass");
      return true;
    } on TestFailure catch (e) {
      print("$name is not displayed - Fail: $e");
      return false;
    }
  }

  Future<bool> pressElement(String name, Finder finder,
      {bool warning = true, int sleepDuration = 2}) async {
    try {
      await tester.ensureVisible(finder);
      await tester.pumpAndSettle();
      await tester.tap(finder, warnIfMissed: warning);
      await tester.pumpAndSettle();
      sleep(Duration(seconds: sleepDuration));
      print("Tap $name - Pass");
      return true;
    } catch (e) {
      print("Tap $name - Fail: $e");
      return false;
    }
  }
}
