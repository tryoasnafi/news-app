import 'package:flutter/material.dart';
import '../constants.dart';
import 'tabs/popular_tab_view.dart';
import 'tabs/recent_tab_view.dart';
import 'tabs/trending_tab_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120.0),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'WELCOME',
                  textAlign: TextAlign.end,
                  style: kNonActiveTabStyle,
                ),
                subtitle: Text(
                  'Tryo Asnafi',
                  textAlign: TextAlign.end,
                  style: kActiveTabStyle,
                ),
                trailing: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage('assets/avatar.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: TabBar(
                  labelColor: kBlack,
                  labelStyle: kActiveTabStyle.copyWith(
                    fontSize: 24.0,
                  ),
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: kGrey1,
                  unselectedLabelStyle: kNonActiveTabStyle.copyWith(
                    fontSize: 16.0,
                  ),
                  tabs: [
                    Tab(
                      text: 'Headlines',
                    ),
                    Tab(
                      text: 'Trending',
                    ),
                    Tab(
                      text: 'Recent',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PopularTabView(),
            TrendingTabView(),
            RecentTabView(),
          ],
        ),
      ),
    );
  }
}
