import 'package:flutter/material.dart';
import '../routes/KuralDetail.dart';
import '../constants.dart';
import '../kurals.dart';
import '../utils.dart';

class FavoriteKurals extends StatefulWidget {
  final Kurals _kurals;

  FavoriteKurals(this._kurals);

  @override
  _FavoriteKuralsState createState() => new _FavoriteKuralsState(_kurals);
}

class _FavoriteKuralsState extends State<FavoriteKurals> {
  final Kurals _kurals;
  bool _fetching = true;
  List<int> _allFavsIndices = [];
  KuralWithIndex _deletedKural;
  ListModel<KuralWithIndex> _list;
  final GlobalKey<AnimatedListState> _listKey =
      new GlobalKey<AnimatedListState>();

  _FavoriteKuralsState(this._kurals);

  _getFavorites() async {
    setState(() {
      _fetching = true;
    });
    _allFavsIndices = (await readFavorites()).toList();
    _allFavsIndices.sort();
    List<KuralWithIndex> favKurals = [];
    for (int index in _allFavsIndices) {
      favKurals.add(new KuralWithIndex(_kurals.kurals[index], index));
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _fetching = false;
      _list = new ListModel<KuralWithIndex>(
        listKey: _listKey,
        initialItems: favKurals,
        removedItemBuilder: _buildRemovedItem,
      );
    });
  }

  _removeFromFavs() async {
    _allFavsIndices.remove(_deletedKural.kuralIndex);
    writeFavoriteList(_allFavsIndices.toSet());
  }

  @override
  void initState() {
    super.initState();
    _getFavorites();
    _deletedKural = null;
  }

  Widget _getCentreProgress() {
    return new Center(
      child: new CircularProgressIndicator(
        value: null,
      ),
    );
  }

  // Used to build list items that haven't been removed.
  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    final kuralWithIndex = _list[index];
    final kural = kuralWithIndex.kural;
    return new CardItem(
        animation: animation,
        kuralWithIndex: kuralWithIndex,
        onFavTap: () async {
          // move to detail page
          Athigaram athigaram = _kurals.athigaarams[kural.athigaramIndex];
          String paal = _kurals.paals[athigaram.paalIndex];
          await Navigator.of(context).push(new MaterialPageRoute<Null>(
            builder: (BuildContext context) => new KuralDetail(
              kural,
              athigaram.name,
              paal,
              _kurals.kurals.indexOf(kural, kural.athigaramIndex),
            ),
          ));
          // the detail page may change the favorite state, so recheck the favorite list
          _getFavorites();
        },
        onFavRemove: () {
          _deletedKural = _list[index];
          _list.removeAt(_list.indexOf(_deletedKural));
          _removeFromFavs();
        }
    );
  }

  // Used to build an item after it has been removed from the list. This method is
  // needed because a removed item remains visible until its animation has
  // completed (even though it's gone as far this ListModel is concerned).
  // The widget will be used by the [AnimatedListState.removeItem] method's
  // [AnimatedListRemovedItemBuilder] parameter.
  Widget _buildRemovedItem(
      KuralWithIndex kural, BuildContext context, Animation<double> animation) {
    return new CardItem(
      animation: animation,
      kuralWithIndex: kural,
      onFavRemove: null,
    );
  }

  Widget _getBody() {
    if (_fetching) {
      return _getCentreProgress();
    }
    return new Container(
        padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
        child: new AnimatedList(
          key: _listKey,
          initialItemCount: _list.length,
          itemBuilder: _buildItem,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _getBody();
  }
}

/// Keeps a Dart List in sync with an AnimatedList.
///
/// The [insert] and [removeAt] methods apply to both the internal list and the
/// animated list that belongs to [listKey].
///
/// This class only exposes as much of the Dart List API as is needed by the
/// sample app. More list methods are easily added, however methods that mutate the
/// list must make the same changes to the animated list in terms of
/// [AnimatedListState.insertItem] and [AnimatedList.removeItem].
class ListModel<E> {
  ListModel({
    this.listKey,
    this.removedItemBuilder,
    Iterable<E> initialItems,
  })  : assert(listKey != null),
        assert(removedItemBuilder != null),
        _items = new List<E>.from(initialItems ?? <E>[]);

  final GlobalKey<AnimatedListState> listKey;
  final dynamic removedItemBuilder;
  final List<E> _items;

  AnimatedListState get _animatedList => listKey.currentState;

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedList.insertItem(index);
  }

  E removeAt(int index) {
    final E removedItem = _items.removeAt(index);
    if (removedItem != null) {
      _animatedList.removeItem(index,
          (BuildContext context, Animation<double> animation) {
        return removedItemBuilder(removedItem, context, animation);
      });
    }
    return removedItem;
  }

  int get length => _items.length;
  E operator [](int index) => _items[index];
  int indexOf(E item) => _items.indexOf(item);
}

Widget _getListTile(KuralWithIndex kuralWithIndex, VoidCallback onRemove, VoidCallback onFavTap) {
  return new Card(
    child: new Column(
      children: <Widget>[
        new ListTile(
          title: new Container(
            padding: const EdgeInsets.only(top: 8.0),
            child: new Text(
              kuralWithIndex.kural.tamil,
              style: new TextStyle(
                fontSize: 13.0,
              ),
            ),
          ),
          subtitle: new Container(
            padding: const EdgeInsets.only(top: 8.0),
            child: new Text(
              "$kKural ${kuralWithIndex.kuralIndex+1}",
            ),
          ),
          onTap: onFavTap,
        ),
        new ButtonTheme.bar(
          // make buttons use the appropriate styles for cards
          child: new ButtonBar(
            children: <Widget>[
              new FlatButton(
                child: const Text('REMOVE'),
                onPressed: onRemove,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key key,
    this.animation,
    this.onFavRemove,
    this.onFavTap,
    this.kuralWithIndex,
  })  : assert(animation != null),
        assert(kuralWithIndex != null),
        super(key: key);

  final Animation<double> animation;
  final VoidCallback onFavRemove;
  final VoidCallback onFavTap;
  final KuralWithIndex kuralWithIndex;

  @override
  Widget build(BuildContext context) {
    return new FadeTransition(
        opacity: animation,
        child: new SizeTransition(
          axis: Axis.vertical,
          sizeFactor: animation,
          child: _getListTile(kuralWithIndex, onFavRemove, onFavTap),
        ));
  }
}

class KuralWithIndex {
  final Kural kural;
  final int kuralIndex;
  KuralWithIndex(this.kural, this.kuralIndex);
}
