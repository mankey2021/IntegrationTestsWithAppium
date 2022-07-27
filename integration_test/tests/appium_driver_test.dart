import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:startup_namer/main.dart' as app;
import '../appium/Appium.dart';
import '../pages/FavoritesPage.dart';
import '../pages/GeneratorPage.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
      as IntegrationTestWidgetsFlutterBinding;
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  Appium appium = Appium();

  GeneratorPage generatorPage;
  FavoritesPage favoritesPage;

  //function ran once before all tests
  setUpAll(() async {
    await appium.startDriver();
  });

  //function ran once after all tests
  tearDownAll(() async {
    await appium.quitDriver();
  });

  group('TestGroup', () {
    testWidgets('Test', (WidgetTester tester) async {
      app.main();

      generatorPage = GeneratorPage(tester);
      favoritesPage = FavoritesPage(tester);

      await tester.pumpAndSettle();
      await generatorPage.isDisplayed();
      await appium.getPageSource();
      await generatorPage.pressSavedListButton();
      await favoritesPage.isDisplayed();
      await appium.getPageSource();
    });
  });
}
