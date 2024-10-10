import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchViewDelegate extends SearchDelegate<String> {
  final List<String> data;

  SearchViewDelegate({required this.data});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: const Icon(CupertinoIcons.chevron_left),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? []
        : data
            .where((e) => e.toLowerCase().contains(query.toLowerCase()))
            .toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        final suggestion = suggestionList[index];
        final queryText = query.toLowerCase();
        return ListTile(
          title: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: _highlightOccurrences(suggestion, queryText),
            ),
          ),
          onTap: () {
            close(context, suggestion);
          },
        );
      },
    );
  }

  List<TextSpan> _highlightOccurrences(String source, String query) {
    if (query.isEmpty) return [TextSpan(text: source)];

    List<TextSpan> spans = [];
    int start = 0;
    int indexOfMatch;

    while ((indexOfMatch =
            source.toLowerCase().indexOf(query.toLowerCase(), start)) !=
        -1) {
      if (indexOfMatch > start) {
        spans.add(TextSpan(text: source.substring(start, indexOfMatch)));
      }

      spans.add(TextSpan(
        text: source.substring(indexOfMatch, indexOfMatch + query.length),
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
      ));

      start = indexOfMatch + query.length;
    }

    if (start < source.length) {
      spans.add(TextSpan(text: source.substring(start)));
    }

    return spans;
  }
}
