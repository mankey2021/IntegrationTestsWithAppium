import 'package:appium_driver/async_io.dart';

class Appium {
  late AppiumWebDriver driver;
  var url = Uri.parse('http://127.0.0.1:4723/wd/hub/');

  Future<AppiumWebDriver> startDriver() async {
    driver = await createDriver(
        uri: url,
        desired: {
          'platformName': 'iOS',
          'appium:platformVersion': '14.7.1',
          'appium:deviceName': 'iPhone 8',
          'appium:automationName': 'XCuiTest',
          'appium:udid': 'efb74219874ad36765199278b41eace032a88337',
          'wdaLocalPort': 8100,
          'useJSONSource': true
        },
        spec: WebDriverSpec.W3c);
    // driver = await createDriver(
    //     uri: url,
    //     desired: {
    //       'platformName': 'Android',
    //       'appium:platformVersion': '11',
    //       'appium:deviceName': 'Pixel 3',
    //       'appium:automationName': 'UIAutomator2',
    //       'appium:udid': '8BAX16S7K'
    //     },
    //     spec: WebDriverSpec.W3c);
    return driver;
  }

  // Future<AppiumWebDriver> startDriverFromExistingSession() async {
  //   driver = await fromExistingSession("9a5196f9-4552-4cb7-84fd-273721a0b661");
  //   return driver;
  // }

  Future<void> quitDriver() async {
    await driver.quit();
  }

  Future<String> getPageSource() async {
    String pageSource = await driver.pageSource;
    print(pageSource);
    return pageSource;
  }
}
