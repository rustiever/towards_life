import 'package:flutter/material.dart';
import '../kurals.dart';
import '../routes/KuralDetail.dart';

class KuralExpansion extends StatelessWidget {
  final Kurals _kurals;

  KuralExpansion(this._kurals);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          new KuralExpansionItem(_kurals, index),
      itemCount: _kurals.paals.length,
    );
  }
}

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class KuralExpansionItem extends StatelessWidget {
  const KuralExpansionItem(this._kurals, this._paalIndex);

  final int _paalIndex;
  final Kurals _kurals;

  Widget _buildKuralListTile(BuildContext context, Kural kural) {
    return new ListTile(
      onTap: () {
        Athigaram athigaram = _kurals.athigaarams[kural.athigaramIndex];
        String paal = _kurals.paals[athigaram.paalIndex];
        bool isFav = false;
        Navigator.of(context).push(new MaterialPageRoute<Null>(
          builder: (BuildContext context) => new KuralDetail(
            kural,
            athigaram.name,
            paal,
            _kurals.kurals.indexOf(kural, kural.athigaramIndex),
          ),
        ));
      },
      title: new Text(
        kural.tamil,
        style: new TextStyle(
          fontSize: 11.0,
        ),
      ),
      trailing: new Icon(Icons.chevron_right),
    );
  }

  Widget _buildAthigaaramExpansionTiles(
      BuildContext context, Athigaram athigaram) {
    return new ExpansionTile(
      key: new PageStorageKey<String>(athigaram.name),
      title: new Text(
        athigaram.name,
        style: new TextStyle(
          fontSize: 13.0,
        ),
      ),
      children: ListTile
          .divideTiles(
            context: context,
            tiles: _kurals.kurals
                .where((kural) =>
                    _kurals.athigaarams[kural.athigaramIndex] == athigaram)
                .map((kural) => _buildKuralListTile(context, kural))
                .toList(),
          )
          .toList(),
    );
  }

  Widget _buildPaalExpansionTiles(BuildContext context) {
    return new Container(
      child: new ExpansionTile(
        key: new PageStorageKey<String>(_kurals.paals[_paalIndex]),
        title: new Text(_kurals.paals[_paalIndex]),
        children: _kurals.athigaarams
            .where((athigaaram) => athigaaram.paalIndex == _paalIndex)
            .map((athigaaram) =>
            _buildAthigaaramExpansionTiles(context, athigaaram))
            .toList(),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildPaalExpansionTiles(context);
  }
}
