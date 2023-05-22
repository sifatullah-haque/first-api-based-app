import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class detailsPage extends StatefulWidget {
  final String article_id;
  const detailsPage({super.key, required this.article_id});

  @override
  State<detailsPage> createState() => _detailsPageState();
}

class _detailsPageState extends State<detailsPage> {
  Map article = {};
  Future<void> getArticle() async {
    http.Response res = await http.get(
      Uri.parse(
          "https://jsonplaceholder.typicode.com/posts/${widget.article_id}"),
    );
    setState(() {
      article = jsonDecode(res.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${article["title"]}"),
      ),
      body: Center(
        child: Center(child: Text("${article["body"]}")),
      ),
    );
  }
}
