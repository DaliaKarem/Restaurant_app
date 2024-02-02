import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurantapp/controller/Fav-Cart/CartController.dart';
import 'package:restaurantapp/core/const/color.dart';
import 'package:restaurantapp/data/model/CartModel.dart';
import 'package:restaurantapp/view/widget/Shared/Add&minContainer.dart';
class ListOfCart extends GetView<CartControllerImp> {
  const ListOfCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: controller.Carts.length,
        itemBuilder: (context, i) {
          if (controller.Carts.length==0) {
            print("emptttttttttttttttttttttttu ");
            return Center(
              child: Lottie.asset("assets/Lottie/Empty.json"),
            );
          } else {
            print("nnnnnnnnnnnnnnnnnnooooot");
            return Body(cartModel: CartModel.fromJson(controller.Carts[i]));
          }
        },
        separatorBuilder: (context, index) => SizedBox(height: 10),
      ),
    );
  }
}

class Body extends StatelessWidget {
  Body({Key? key, required this.cartModel}) : super(key: key);

  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: GetBuilder<CartControllerImp>(
            builder: (controller){
              return Column(
                children: [
                  Card(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Image.network(
                              cartModel.nameProduct!.img!,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text("${cartModel.nameProduct!.name}"),
                                ),
                                ListTile(title: Text("${cartModel.nameProduct!.price}")),
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
                                        // controller.removeFrompage(favModel.itemId!);
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
              );
            },
          )
      ),
    );
  }
}