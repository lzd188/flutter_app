import 'package:flutter/material.dart';
import 'asset.dart';

class MySearchBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Bar Demo'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () =>
                showSearch(context: context, delegate: SearchBarDelegate()),
          )
        ],
      ),
    );
  }
}

class SearchBarDelegate extends SearchDelegate<String> {
  // 更改显示的图标
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      color: Colors.lightBlue,
      child: Center(
        child: Text(query),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? recommendList
        : searchList.where((input) => input.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: RichText(
            text: TextSpan(
              text: suggestions[index].substring(0, query.length),
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.lightBlue),
              children: [
                TextSpan(
                  text: suggestions[index].substring(query.length),
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          onTap: () => query = suggestions[index],
        );
      },
    );
  }
}
