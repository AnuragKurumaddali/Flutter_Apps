import 'package:flutter/material.dart';
import 'package:google_clone/widget/search_tab.dart';

class SearchBarTabs extends StatelessWidget {
  const SearchBarTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 55,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SearchTab(
            isActive: true,
            title: 'All',
            iconData: Icons.search,
          ),
          SizedBox(width: 20),
          SearchTab(
            title: 'Images',
            iconData: Icons.image,
          ),
          SizedBox(width: 20),
          SearchTab(
            title: 'Maps',
            iconData: Icons.map,
          ),
          SizedBox(width: 20),
          SearchTab(
            title: 'News',
            iconData: Icons.article,
          ),
          SizedBox(width: 20),
          SearchTab(
            title: 'Shopping',
            iconData: Icons.shop,
          ),
          SizedBox(width: 20),
          SearchTab(
            title: 'More',
            iconData: Icons.more_vert,
          ),
        ],
      ),
    );
  }
}
