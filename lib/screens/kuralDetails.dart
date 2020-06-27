import 'package:TowardsLife/Models/Kurals.dart';
import 'package:flutter/material.dart';

class Thirukkural extends StatefulWidget {
  final Kural kurals;

  const Thirukkural({Key key, this.kurals}) : super(key: key);
  @override
  _ThirukkuralState createState() => _ThirukkuralState();
}

class _ThirukkuralState extends State<Thirukkural> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.separated(
            itemBuilder: (_, index) => ListTile(
                  title: Text(widget.kurals.kural[index].line1),
                ),
            separatorBuilder: (_, index) => Divider(),
            itemCount: widget.kurals.kural.length),
      ),
    );
  }
}
