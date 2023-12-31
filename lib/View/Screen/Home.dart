import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/HomeScreenController.dart';
import 'package:restaurantapp/core/const/color.dart';
import 'package:restaurantapp/view/widget/Sign/TextFormField.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(homeSceenControllerImp());

    return GetBuilder<homeSceenControllerImp>(builder: (controller) {
      return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              selectedItemColor:  colorApp.primary ,
              currentIndex: controller.currentage,
              onTap: (index) {
                controller.changepage(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: (controller.currentage == 0)
                        ? colorApp.primary
                        : Colors.grey,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                    color: (controller.currentage == 1)
                        ? colorApp.primary
                        : Colors.grey,
                  ),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: (controller.currentage == 2)
                        ? colorApp.primary
                        : Colors.grey,
                  ),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu_book,
                    color: (controller.currentage == 3)
                        ? colorApp.primary
                        : Colors.grey,
                  ),
                  label: 'Menu',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle,
                    color: (controller.currentage == 4)
                        ? colorApp.primary
                        : Colors.grey,
                  ),
                  label: 'Account',
                ),
              ],
            ),
          ),
        ),
        body: controller.Pages.elementAt(controller.currentage),
      );
    });
  }
}