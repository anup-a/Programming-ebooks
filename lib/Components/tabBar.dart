import 'package:ebookApp/styles.dart';
import 'package:flutter/material.dart';

class TabNavigationBar extends StatelessWidget {
  const TabNavigationBar({
    Key key,
    @required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
      ),
      child: TabBar(
        indicatorColor: Colors.transparent,
        controller: tabController,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey.withOpacity(0.6),
        isScrollable: true,
        tabs: <Tab>[
          Tab(
            child: Text(
              'All',
              style: kTabStyle,
            ),
          ),
          Tab(
            child: Text(
              'Software Dev.',
              style: kTabStyle,
            ),
          ),
          Tab(
            child: Text(
              'Algorithms',
              style: kTabStyle,
            ),
          ),
          Tab(
            child: Text(
              'Web Dev.',
              style: kTabStyle,
            ),
          ),
          Tab(
            child: Text(
              'Game Dev.',
              style: kTabStyle,
            ),
          )
        ],
      ),
    );
  }
}
