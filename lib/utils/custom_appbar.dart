import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool isSearchIconVisible;
  const CustomAppBar({super.key,required this.title, required this.isSearchIconVisible});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _isSearching
          ? TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
              ),
              style: const TextStyle(color: Colors.white),
              autofocus: true,
            )
          : Text(
              widget.title,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
      centerTitle: widget.isSearchIconVisible?false : true,
      backgroundColor: ThemeData().primaryColor,
      actions: [
          if(widget.isSearchIconVisible) IconButton(
            onPressed: () {
              setState(() {
                if (widget.isSearchIconVisible) {
                  _isSearching = !_isSearching;
                  if (!_isSearching) {
                    _searchController.clear();
                  }
                }
              });
            },
            icon: Icon(_isSearching ? Icons.close : Icons.search),
          )
      ],
    );
  }
}
