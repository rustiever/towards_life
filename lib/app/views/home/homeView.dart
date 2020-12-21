import 'package:TowardsLife/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScafflod(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 17.0, vertical: 5),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Column(
                        children: const [
                          Text(
                            'Choose Your Favorite ',
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                // fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black45),
                          ),
                          Text(
                            'From Our Library ',
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                // fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  flex: 3,
                  child: FlipList(),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.pinkAccent,
            ),
          ),
          Expanded(
            // flex: 3,
            child: Container(
              color: Colors.deepOrange,
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.greenAccent,
                height: 40,
                width: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
