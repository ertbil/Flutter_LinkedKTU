import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
    required TextEditingController searchController,
    required this.search,
  })  : _searchController = searchController,
        super(key: key);

  final Function search;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 40,
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: const Icon(Icons.search),


          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
            borderSide: BorderSide.none,
          ),
          hintText: 'Search',

          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    _searchController.clear();
                   search('');
                  },
                  icon: const Icon(Icons.delete),
                )
              : null,
          hintStyle: const TextStyle(color: Colors.black, fontSize: 16),

          contentPadding: const EdgeInsets.only(top: 20),
          filled: true,
          fillColor: Colors.white,
        ),
        style: const TextStyle(color: Colors.black),
        onChanged: (value) {
          search(value);
        },
      ),
    );
  }
}
