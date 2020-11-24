import 'package:flutter/material.dart';

class CustomDraggableScrollableSheet extends StatelessWidget {
  const CustomDraggableScrollableSheet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      // maxChildSize: 0.8,
      initialChildSize: 0.1,
      minChildSize: 0.1,
      builder: (BuildContext context, ScrollController scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: CustomScrollViewContent(),
        );
      },
    );
  }
}

class CustomScrollViewContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 12.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: CustomInnerContent(),
      ),
    );
  }
}

class CustomInnerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 12),
        CustomDraggingHandle(),
        const SizedBox(height: 12),
        const Text(
          "Recent Explorings",
          style: TextStyle(fontSize: 22, color: Colors.black45),
        ),
        Expanded(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => const ListTile(
              title: Text('dataaaa'),
              subtitle: Text('hello'),
            ),
            cacheExtent: 1,
            itemCount: 45,
          ),
        ),
        // SizedBox(height: 16),

        // SizedBox(height: 16),
        // CustomHorizontallyScrollingRestaurants(),
        // SizedBox(height: 24),
        // CustomFeaturedListsText(),
        // SizedBox(height: 16),
        // CustomFeaturedItemsGrid(),
        // SizedBox(height: 24),
        // CustomRecentPhotosText(),
        // SizedBox(height: 16),
        // CustomRecentPhotoLarge(),
        // SizedBox(height: 12),
        // CustomRecentPhotosSmall(),
        // SizedBox(height: 16),
      ],
    );
  }
}

class CustomDraggingHandle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
