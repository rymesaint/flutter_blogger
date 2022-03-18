import 'package:blogspot/src/constants/app.color.dart';
import 'package:blogspot/src/shared_widgets/custom_browser.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

openWebpageLink(String url) async {
  //
  ChromeSafariBrowser browser = CustomBrowser();
  await browser.open(
    url: Uri.parse(url),
    options: ChromeSafariBrowserClassOptions(
      android: AndroidChromeCustomTabsOptions(
        addDefaultShareMenuItem: false,
        enableUrlBarHiding: true,
        toolbarBackgroundColor: AppColor.primaryColor,
      ),
      ios: IOSSafariOptions(
        barCollapsingEnabled: true,
        entersReaderIfAvailable: true,
        preferredBarTintColor: AppColor.primaryColor,
      ),
    ),
  );
  //
}
