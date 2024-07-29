import 'package:flutter/material.dart';
import 'package:google_clone/constants/colors.dart';
import 'package:google_clone/services/api_service.dart';
import 'package:google_clone/widget/search_result_component.dart';
import 'package:google_clone/widget/search_result_footer.dart';
import 'package:google_clone/widget/searchbar_tabs.dart';
import 'package:google_clone/widget/web/web_search_result_header.dart';

class SearchResult extends StatelessWidget {
  final String start;
  final String searchQuery;

  const SearchResult({super.key, required this.searchQuery, this.start = "0"});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Title(
      color: Colors.blue,
      title: searchQuery,
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchResultHeader(),
              Padding(
                padding: EdgeInsets.only(left: size.width <= 768 ? 10 : 150.0),
                child: const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal, child: SearchBarTabs()),
                ),
              ),
              const Divider(
                height: 0,
                thickness: 0.3,
              ),
              FutureBuilder(
                future: ApiService().fetchData(query: ""),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: 12, left: size.width <= 768 ? 10 : 150),
                          child: Text(
                            "About ${snapshot.data?["searchInformation"]["formattedTotalResults"]} results ${snapshot.data?["searchInformation"]["formattedSearchTime"]} seconds",
                            style: const TextStyle(
                                fontSize: 15, color: Color(0xFF70757a)),
                          ),
                        ),
                        ListView.builder(
                          itemCount: (snapshot.data?["items"] as List).length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final val =
                                (snapshot.data?["items"] as List)[index];
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: size.width <= 768 ? 10 : 150, top: 10),
                              child: SearchResultComponent(
                                  link: val["link"],
                                  linkToGo: val["formattedUrl"],
                                  text: val["title"],
                                  desc: val["snippet"]),
                            );
                          },
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  if (start != "0") {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) {
                                        return SearchResult(
                                          searchQuery: searchQuery,
                                          start: (int.parse(start) - 10)
                                              .toString(),
                                        );
                                      },
                                    ));
                                  }
                                },
                                child: const Text(
                                  "< Prev",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: blueColor,
                                  ),
                                )),
                            const SizedBox(width: 30),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return SearchResult(
                                        searchQuery: searchQuery,
                                        start:
                                            (int.parse(start) + 10).toString(),
                                      );
                                    },
                                  ));
                                },
                                child: const Text(
                                  "Next >",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: blueColor,
                                  ),
                                )),
                            const SizedBox(height: 30),
                          ],
                        ),
                        const SearchResultFooter(),
                        const SizedBox(height: 10),
                      ],
                    );
                  }

                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
