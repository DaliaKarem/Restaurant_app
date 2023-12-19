import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:restaurantapp/core/class/crud.dart';

class IntialBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(crud());
  }

}