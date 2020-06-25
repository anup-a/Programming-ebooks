import 'package:ebookApp/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsTabBar extends StatelessWidget {
  const BookDetailsTabBar({
    Key key,
    @required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        indicatorColor: Colors.transparent,
        controller: tabController,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey.withOpacity(0.6),
        isScrollable: true,
        tabs: <Tab>[
          Tab(
            child: Text(
              'Description',
              style: kTabStyle,
            ),
          ),
          Tab(
            child: Text(
              'Reviews',
              style: kTabStyle,
            ),
          ),
          Tab(
            child: Text(
              'Suggestions',
              style: kTabStyle,
            ),
          ),
        ],
      ),
    );
  }
}
