import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("Search App"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Search());
              },
              icon: Icon(Icons.search))
        ],
      ),
    );
  }
}

class Search extends SearchDelegate<String> {
  final city = [
    "Agartala",
    "Agra",
    "Ahmedabad",
    "Aizwal",
    "Allahabad",
    "Alleppy",
    "Alibaug",
    "Almora",
    "Alisar",
    "Amla",
    "Nandurbar",
    "Pune",
    "Mumbai",
    "Jalgoan",
    "Parola",
    "America"
  ];

  final recent = ["Alibaug", "Pune", "Mumbai", "Nandurbar", "Jalgoan"];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "null");
        },
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Card(
      child: Center(
        child: Text(
          "Welcome to " + query,
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final sugg = query.isEmpty
        ? recent
        : city.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: RichText(
          text: TextSpan(
              text: sugg[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: sugg[index].substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: sugg.length,
    );
  }
}
