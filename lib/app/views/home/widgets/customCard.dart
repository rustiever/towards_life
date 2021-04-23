import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/controllers.dart';
import '../../../data/model/models.dart';

class FlipList extends GetView<HomeController> {
  const FlipList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: controller.scrollController,
        physics: const BouncingScrollPhysics(),
        itemCount: topicList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, int index) =>
            //  ValueBuilder(
            //   initialValue: false,
            //   builder: (bool snapshot, void Function(bool) updater) {
            //     return Center(
            //       child: GestureDetector(
            //         onDoubleTap: () => updater(snapshot = !snapshot),
            //         child: FlippableBox(
            //           isFlipped: snapshot,
            //           front: _buildCard(index),
            //           back: _buildCard(index, back: true),
            //         ),
            //       ),
            //     );
            //   },
            // ),
            CustomCard(topic: topicList[index], back: false));
  }

  // Container _buildCard(int index, {bool back = false}) {
  //   return Container(
  //     height: double.infinity,
  //     width: 140,
  //     decoration: const BoxDecoration(color: Colors.transparent),
  //     child: CustomCard(
  //       back: back,
  //       topic: topicList[index],
  //     ),
  //   );
  // }
}

class CustomCard extends StatelessWidget {
  final Topic topic;
  final bool back;
  const CustomCard({
    Key? key,
    required this.topic,
    required this.back,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Card(
        borderOnForeground: false,
        margin: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            // Radius.elliptical(25, 50),
            Radius.circular(30),
          ),
        ),
        elevation: 5.5,
        child: back
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CustomTextField(topic: topic)],
              )
            : GestureDetector(
                onTap: () => Get.toNamed(
                    '${topic.name}?name=${topic.name.substring(1)}'),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          topic.asset,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Text(
                            topic.name.substring(1),
                          ),
                        ),
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        topic.length.toString(),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.topic,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextFormField(
          validator: (value) {
            return value!.isEmpty
                ? "Can't be empty"
                : !value.isNum
                    ? 'Not a number'
                    : !int.tryParse(value)!.isLowerThan(topic.length)
                        ? 'Not valid range'
                        : null;
          },
          // onSaved: _search,
          onFieldSubmitted: _search,
          textInputAction: TextInputAction.search,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            labelText: 'Go To',
            hintText: 'Go TO',
          ),
        ),
      ),
    );
  }

  void _search(String value) {
    if (_formKey.currentState!.validate()) {
      printInfo(info: value);
    }
  }
}

class FlippableBox extends StatelessWidget {
  final Container front;
  final Container back;

  final bool isFlipped;

  const FlippableBox({
    Key? key,
    this.isFlipped = false,
    required this.front,
    required this.back,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 700),
      curve: Curves.decelerate,
      tween: Tween(begin: 0.0, end: isFlipped ? 180.0 : 0.0),
      builder: (context, double value, child) {
        final content = value >= 90 ? back : front;
        return RotationY(
          rotationY: value,
          child: RotationY(
            rotationY: value > 90 ? 180 : 0,
            child: AnimatedBackground(child: content),
          ),
        );
      },
    );
  }
}

class AnimatedBackground extends StatelessWidget {
  final Container child;
  const AnimatedBackground({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        width: child.constraints!.maxWidth,
        height: child.constraints!.maxHeight,
        duration: const Duration(milliseconds: 700),
        curve: Curves.decelerate,
        child: child);
  }
}

class RotationY extends StatelessWidget {
  //Degrees to rads constant
  static const double degrees2Radians = pi / 180;

  final Widget child;
  final double rotationY;

  const RotationY({Key? key, required this.child, this.rotationY = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001) //These are magic numbers, just use them :)
          ..rotateY(rotationY * degrees2Radians),
        child: child);
  }
}
