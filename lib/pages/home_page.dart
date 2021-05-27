import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _search;
  int? _offset = 0;

  @override
  void initState() {
    super.initState();

    _getGifs().then((map) {
      print(map);
    });
  }

  Future<Map> _getGifs() async {
    var trendingURL = Uri.https('api.giphy.com', '/v1/gifs/trending', {
      'api_key': 'xvvasi0Sgm7qVIyWxsbUTQp3Ge53WlBr',
      'limit': '20',
      'rating': 'g'
    });

    var searchURL = Uri.https('api.giphy.com', '/v1/gifs/search', {
      'api_key': 'xvvasi0Sgm7qVIyWxsbUTQp3Ge53WlBr',
      'q': _search,
      'limit': '20',
      'offset': '$_offset',
      'rating': 'g',
      'lang': 'pt'
    });

    http.Response response;
    if (_search == null) {
      response = await http.get(trendingURL);
    } else {
      response = await http.get(searchURL);
    }

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
