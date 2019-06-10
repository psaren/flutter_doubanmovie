import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:doubanmovie/hot/hotlist/data/HotMovieData.dart';
import 'package:doubanmovie/hot/hotlist/item/HotMovieItemWidget.dart';
import 'package:http/http.dart' as http;

class HotMoviesListWidget extends StatefulWidget {
  String curCity;
  HotMoviesListWidget(String city) {
    curCity = city;
  }

  _HotMoviesListWidgetState createState() => _HotMoviesListWidgetState();
}


class _HotMoviesListWidgetState extends State<HotMoviesListWidget> with AutomaticKeepAliveClientMixin {
  List<HotMovieData> hotMovies = new List<HotMovieData>();
  List<HotMovieData> serverDataList = new List();
  void _getData () async {
    List<HotMovieData> serverDataList = new List();
    var response = await http.get(
        'https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city='
        + widget.curCity
        + '&start=0&count=10&client=&udid=');
    //成功获取数据
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      for (dynamic data in responseJson['subjects']) {
        HotMovieData hotMovieData = HotMovieData.fromJson(data);
        serverDataList.add(hotMovieData);
      }
      setState(() {
        hotMovies = serverDataList;
      });
    } 
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }
  @override
  Widget build(BuildContext context) {
     if (hotMovies == null || hotMovies.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.separated(
          itemCount: hotMovies.length,
          itemBuilder: (BuildContext context, int index) {
            return HotMovieItemWidget(hotMovieData: hotMovies[index]);
          },
          separatorBuilder: (BuildContext context, index) {
            return Divider(
              height: 1,
              color: Colors.black26
            );
          }
        ),
      );
    }
  }
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true; //返回 true，表示不会被回收
}
