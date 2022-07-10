import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  final String? searchValue;

  SearchView(this.searchValue);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String? _searchValue;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
