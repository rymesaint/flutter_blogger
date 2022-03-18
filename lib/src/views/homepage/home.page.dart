import 'package:blogspot/src/constants/app.color.dart';
import 'package:blogspot/src/shared_widgets/base.page.dart';
import 'package:blogspot/src/view_models/homepage.vm.dart';
import 'package:blogspot/src/views/homepage/widgets/post_gridview.dart';
import 'package:blogspot/src/views/homepage/widgets/post_listview.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomepageViewModel>.reactive(
      viewModelBuilder: () => HomepageViewModel(context),
      onModelReady: (vm) => vm.fetchPosts(isRefresh: true),
      builder: (context, vm, child) => BasePage(
        title: 'Ryme Tutorial',
        showAppBar: true,
        actions: [
          IconButton(
            onPressed: vm.searchPost,
            icon: Icon(
              Icons.search,
              color: AppColor.primaryColor,
            ),
          ),
        ],
        body: SmartRefresher(
          controller: vm.refreshController,
          onRefresh: () => vm.fetchPosts(isRefresh: true),
          onLoading: () => vm.fetchPosts(),
          enablePullUp: true,
          child:
              vm.gridView == true ? const PostGridView() : const PostListView(),
        ),
        fab: ToggleSwitch(
          totalSwitches: 2,
          iconSize: 14,
          icons: const [Icons.grid_view_rounded, Icons.view_list_rounded],
          cornerRadius: 30,
          customWidths: const [50, 50],
          borderWidth: 10,
          onToggle: (value) => vm.changeViewTemplate(value),
          initialLabelIndex: vm.gridView == true ? 0 : 1,
          changeOnTap: true,
        ),
      ),
    );
  }
}
