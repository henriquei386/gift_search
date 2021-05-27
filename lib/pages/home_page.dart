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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network(
          'https://developers.giphy.com/branch/master/static/header-logo-8974b8ae658f704a5b48a2d039b8ad93.gif',
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Pesquise aqui',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepPurple,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.deepPurple),
            ),
          )
        ],
      ),
    );
  }
}
