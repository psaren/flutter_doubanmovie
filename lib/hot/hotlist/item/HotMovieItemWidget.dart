import 'package:flutter/material.dart';
import 'package:doubanmovie/hot/hotlist/data/HotMovieData.dart';

class HotMovieItemWidget extends StatefulWidget {
  final HotMovieData hotMovieData;
  HotMovieItemWidget({Key key, @required this.hotMovieData}) : super(key: key);
  // HotMovieItemWidget(this.hotMovieData);

  _HotMovieItemWidgetState createState() => _HotMovieItemWidgetState();
}

class _HotMovieItemWidgetState extends State<HotMovieItemWidget> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 161,
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            widget.hotMovieData.images.small,
            width: 80,
            height: 120,
            fit: BoxFit.cover,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.hotMovieData.title,
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    widget.hotMovieData.rating.average.toString(),
                    style: TextStyle(fontSize: 14.0, color: Colors.black54),
                  ),
                  Text(
                    '导演: ' + widget.hotMovieData.getDirectors(),
                    style: TextStyle(fontSize: 14.0, color: Colors.black54),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '主演: ' + widget.hotMovieData.getCasts(),
                    style: TextStyle(fontSize: 14.0, color: Colors.black54),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.hotMovieData.collectCount.toString() + '人看过', 
                  style: TextStyle(color: Colors.red, fontSize: 14.0)
                ),
                OutlineButton(
                  child: Text('购票', style: TextStyle(color: Colors.red, fontSize: 16)),
                  color: Colors.red,
                  // highlightColor: Colors.red,
                  borderSide: BorderSide(
                    color: Colors.red
                  ),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}