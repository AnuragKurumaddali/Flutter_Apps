import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_clone/constants/colors.dart';
import 'package:google_clone/pages/search_result_layout.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width > 768 ? size.width * 0.4 : size.width * 0.9,
      child: TextFormField(
        onFieldSubmitted: (text) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return SearchResult(searchQuery: text,start: "0",);
          },));
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: searchBorder,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                "assets/images/search-icon.svg",
                colorFilter:
                    const ColorFilter.mode(searchBorder, BlendMode.srcATop),
              ),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset("assets/images/mic-icon.svg"),
            )),
      ),
    );
  }
}
