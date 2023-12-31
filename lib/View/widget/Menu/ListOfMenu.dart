import 'package:flutter/material.dart';
import 'package:restaurantapp/view/widget/HomePage/ImageContainer.dart';
class ListOfMenu extends StatelessWidget {
  const ListOfMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
              child: ContainerOfTreding(onTap: () {  }, title: 'jndcjnsc dcjndj', des: 'ndcjdnnc jvnjnvn', img: 'https://img.freepik.com/free-photo/fresh-pasta-with-hearty-bolognese-parmesan-cheese-generated-by-ai_188544-9469.jpg',),

          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
      ),
    );
  }
}
