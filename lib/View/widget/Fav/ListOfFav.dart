import 'package:flutter/material.dart';
import 'package:restaurantapp/core/const/color.dart';

class ListOfFav extends StatelessWidget {
  const ListOfFav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Card(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Image.network(
                              "https://img.freepik.com/free-photo/fresh-pasta-with-hearty-bolognese-parmesan-cheese-generated-by-ai_188544-9469.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text("{favModel.itemName}"),
                                ),
                                ListTile(title: Text("{favModel.itemPrice}")),
                                Row(
                                  children: [
                                    MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 12),
                                      onPressed: () {},
                                      child: Text("Add to Cart"),
                                      color: colorApp.primary,
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.restore_from_trash_rounded,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        //controller.removeFrompage(favModel.itemId!);
                                        print("Removed");
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 10),
      ),
    );
  }
}

// class Body extends StatelessWidget {
//   Body({Key? key, required this.favModel}) : super(key: key);
//
//   final FavModel favModel;
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {},
//       child: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Column(
//           children: [
//             Card(
//               child: Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       flex: 4,
//                       child: Image.network(
//                         "https://img.fruugo.com/product/9/89/535273899_max.jpg",
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                     Expanded(
//                       flex: 3,
//                       child: Column(
//                         children: [
//                           ListTile(
//                             title: Text("${favModel.itemName}"),
//                           ),
//                           ListTile(title: Text("${favModel.itemPrice}")),
//                           Row(
//                             children: [
//
//                               MaterialButton(
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(20)),
//                                 padding:
//                                 EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                                 onPressed: () {},
//                                 child: Text("Add to Cart"),
//                                 color: colorApp.primary,
//                               ),
//                               IconButton(
//                                 icon: Icon(
//                                   Icons.restore_from_trash_rounded,
//                                   color: Colors.red,
//                                 ),
//                                 onPressed: () {
//                                   controller.removeFrompage(favModel.itemId!);
//                                   print("Removed");
//                                 },
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
