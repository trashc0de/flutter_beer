import 'package:flutter/material.dart';
import 'package:flutterapp/domain/beer.dart';

class ItemBeerWidget extends StatelessWidget {
  final Beer data;

  ItemBeerWidget({this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      height: 100,
      width: double.infinity,
      child: Row(
        children: [
          Container(
              width: 100,
              height: 100,
              child: Image.network(
                data.imageUrl != null ? data.imageUrl : "",
              )),
          Column(
            children: [
              Text(
                data.name,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ],
      ),
    );
  }
}
