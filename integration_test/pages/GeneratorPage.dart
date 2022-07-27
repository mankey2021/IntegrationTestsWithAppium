import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../core/HelperMethods.dart';

class GeneratorPage extends HelperMethods {
  GeneratorPage(this.tester) : super(tester);

  final WidgetTester tester;

  final title = find.byKey(ValueKey('NameGeneratorTitleKey'));
  final savedListButton = find.byKey(ValueKey('favoritesButtonKey'));

  Future<void> isDisplayed() async {
    isElementDisplayed("Name Generator Page", title);
  }

  Future<void> pressSavedListButton() async {
    await pressElement("Saved List Button", savedListButton);
  }
}
