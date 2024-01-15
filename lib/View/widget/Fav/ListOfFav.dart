import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/Fav-Cart-Menu/FavController.dart';
import 'package:restaurantapp/core/const/color.dart';
import 'package:restaurantapp/data/model/FavModel.dart';

class ListOfFav extends GetView<FavControllerImp> {
  const ListOfFav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: controller.Favs.length,
        itemBuilder: (context, i) {
          return Body(favModel: FavModel.fromJson(controller.Favs[i]));
        },
        separatorBuilder: (context, index) => SizedBox(height: 20),
      ),
    );
  }
}

class Body extends StatelessWidget {
  Body({Key? key, required this.favModel}) : super(key: key);

  final FavModel favModel;

  @override
  Widget build(BuildContext context) {
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
                       favModel.nameProduct!.img!,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text("${favModel.nameProduct!.name!}"),
                          ),
                          ListTile(title: Text("${favModel.nameProduct!.price}")),
                          Row(
                            children: [

                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                padding:
                                EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
  }
}
