import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:net/pages/details_page.dart';

class homePage extends StatelessWidget {
  final List data;
  const homePage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Card(
            child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => detailsPage(article_id: data[index]["id"].toString()),
            ));
          },
          child: ListTile(
            leading: CircleAvatar(
              child: Text(data[index]["id"].toString()),
            ),
            title: Text(data[index]["title"]),
          ),
        )),
        itemCount: data.length,
      ),
    );
  }
}
