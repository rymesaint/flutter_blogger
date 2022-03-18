import 'package:blogspot/src/utils/ui.spacer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BasePage extends StatelessWidget {
  final bool? showAppBar;
  final bool showLeadingAction;
  final bool? extendBodyBehindAppBar;
  final Function()? onBackPressed;
  final bool? showNotification;
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final Widget? body;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  final Widget? fab;
  final bool? isLoading;
  final Color? appBarColor;
  final double? elevation;
  final Color? appBarItemColor;
  final bool showSearch;
  final Color? titleColor;
  final FloatingActionButtonLocation? floatingActionLocation;
  final PreferredSizeWidget? bottom;
  final Widget? flexibleSpace;
  final double? toolbarHeight;

  const BasePage({
    this.showAppBar = false,
    this.leading,
    this.showLeadingAction = false,
    this.onBackPressed,
    this.title = "",
    this.actions,
    this.body,
    this.bottomSheet,
    this.bottomNavigationBar,
    this.fab,
    this.isLoading = false,
    this.appBarColor,
    this.appBarItemColor,
    this.elevation,
    this.extendBodyBehindAppBar,
    this.showNotification = false,
    this.showSearch = false,
    this.floatingActionLocation,
    this.titleColor,
    this.bottom,
    this.flexibleSpace,
    this.toolbarHeight = kToolbarHeight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
      appBar: showAppBar == true
          ? AppBar(
              backgroundColor: appBarColor,
              elevation: elevation,
              automaticallyImplyLeading: showLeadingAction,
              leading: showLeadingAction
                  ? leading == null && Navigator.of(context).canPop()
                      ? IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: appBarItemColor ?? Colors.black,
                          ),
                          onPressed:
                              onBackPressed ?? () => Navigator.pop(context),
                        )
                      : leading
                  : null,
              title: title!.text
                  .maxLines(1)
                  .color(titleColor ?? Colors.black)
                  .ellipsis
                  .semiBold
                  .xl
                  .make(),
              actions: actions,
              centerTitle: true,
              bottom: bottom,
              flexibleSpace: flexibleSpace,
              toolbarHeight: toolbarHeight,
            )
          : null,
      body: VStack(
        [
          //
          isLoading == true
              ? const LinearProgressIndicator()
              : UiSpacer.emptySpace(),

          //
          body!.expand(),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      floatingActionButton: fab,
      floatingActionButtonLocation: floatingActionLocation,
    );
  }
}
