import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../core/HelperMethods.dart';

class FavoritesPage extends HelperMethods {
  FavoritesPage(this.tester) : super(tester);

  final WidgetTester tester;

  final title = find.byKey(ValueKey('FavoritesTitleKey'));

  Future<void> isDisplayed() async {
    isElementDisplayed("Favorites Page", title);
  }
}
