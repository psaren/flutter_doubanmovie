import 'package:flutter/material.dart';

class MovieWidget extends StatefulWidget {
  MovieWidget({Key key}) : super(key: key);

  _MovieWidgetState createState() => _MovieWidgetState();
}

class _MovieWidgetState extends State<MovieWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 80,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
            decoration: InputDecoration(
              hintText: '\uE8b6 电影 / 电视剧 / 影人',
              hintStyle: TextStyle(fontFamily: 'MeteriaIcons', fontSize: 16.0),
              contentPadding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(5.0))
              ),
              filled: true,
              fillColor: Colors.black12
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints.expand(height: 50.0),
                  child: TabBar(
                    unselectedLabelColor: Colors.black12,
                    labelColor: Colors.black87,
                    indicatorColor: Colors.black87,
                    tabs: <Widget>[
                      Tab(text: '电影'),
                      Tab(text: '电视'),
                    ],
                  )
                ),
                Expanded(
                  child: Container(
                    child: TabBarView(
                      children: <Widget>[
                        Center(
                          child: Text('电影'),
                        ),
                        Center(
                          child: Text('电视'),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        )
      ],
    );
  }
}