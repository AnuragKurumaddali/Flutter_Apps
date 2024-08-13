import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_clone/constants/colors.dart';
import 'package:google_clone/widget/search_body.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.grey,
            ),
          ),
          title: SizedBox(
            width: size.width * 0.34,
            child: const DefaultTabController(
                length: 2,
                child: TabBar(
                    labelColor: blueColor,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: blueColor,
                    dividerColor: Colors.transparent,
                    tabs: [
                  Tab(
                    text: "ALL",
                  ),
                  Tab(
                    text: "Images",
                  ),
                ])),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/images/more-apps.svg",
                colorFilter:
                    const ColorFilter.mode(primaryColor, BlendMode.srcATop),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10).copyWith(right: 10),
              child: MaterialButton(
                onPressed: () {},
                color: const Color(0xff1A73EB),
                child: const Text(
                  "Sign in",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
        body: const SearchBody(isMobileLayout: true),
      ),
    );
  }
}
