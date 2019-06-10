import 'package:flutter/material.dart';
import 'package:doubanmovie/hot/hotlist/HotMoviesListWidget.dart';

class HotWidget extends StatefulWidget {
  HotWidget({Key key}) : super(key: key);

  _HotWidgetState createState() => _HotWidgetState();
}

class _HotWidgetState extends State<HotWidget> {
  String curCity = '深圳';

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('HotWidgetState initState');
    setState(() {
      curCity =  curCity;
    });
  }
  void _jumpToCitysWidget() async{
    var selectCity = await Navigator.pushNamed(context, '/Citys',arguments: curCity);
    if(selectCity == null) return;
    setState(() {
      curCity =  selectCity;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 80,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: <Widget>[
              GestureDetector(
                child: Text(curCity, style: TextStyle(fontSize: 16.0)),
                onTap: () {
                  _jumpToCitysWidget();
                },
              ),
              Icon(Icons.arrow_drop_down),
              Expanded(
                flex: 1,
                child: TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                  decoration: InputDecoration(
                    hintText: '\uE8b6 电影 / 电视剧 / 影人',
                    hintStyle: TextStyle(fontFamily: 'MaterialIcons', fontSize: 16.0),
                    contentPadding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(5.0))
                    ),
                    filled: true,
                    fillColor: Colors.black12
                  ),
                ),
              )
            ],
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
                      Tab(text: '正在热映'),
                      Tab(text: '即将上映'),
                    ],
                  )
                ),
                Expanded(
                  child: Container(
                    child: TabBarView(
                      children: <Widget>[
                        HotMoviesListWidget(curCity),
                        Center(
                          child: Text('即将上映'),
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