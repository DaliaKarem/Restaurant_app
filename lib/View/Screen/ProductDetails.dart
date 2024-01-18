import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/ProductDetailsController.dart';
import 'package:restaurantapp/core/const/color.dart';
import 'package:restaurantapp/core/functions/showDialog.dart';
import 'package:restaurantapp/view/widget/Shared/Add&minContainer.dart';
import 'package:restaurantapp/view/widget/Shared/ButtonInSign.dart';
import 'package:restaurantapp/view/widget/Shared/largetext.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controllerImp = Get.put(
        ProductDetailsControllerImp());

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(
              controllerImp.img!,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.5,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LargeText(text: controllerImp.name,
                    fontSize: 35,
                    color: Colors.black,),
                  LargeText(text: "Category : ${controllerImp.cate}"),
                  Row(
                    children: [
                      LargeText(text: 'Price: '),
                      LargeText(text: '\$${controllerImp.price}',
                        color: colorApp.primary,),
                      Spacer(),
                      AddMinConatiner(),
                    ],
                  ),
                  LargeText(text: controllerImp.desc),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RatingBar.builder(
                      initialRating: 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) =>
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                      itemSize: 20,
                      onRatingUpdate: (rating) {
                        print(rating);
                        showAlertDialog(context, "Submit",
                            "Are you sure you want to send this rating?").then((
                            value) =>
                        {
                          if(value==true)
                            {
                              controllerImp.rateProduct(rating)
                            }
                        }
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Row(
                      children: [
                        IconButton(onPressed: () {},
                            icon: Icon(Icons.favorite, color: Colors.red,)),
                        Spacer(),
                        ButtonInSign(textbutton: "Add To Cart",
                            onPressed: () {},
                            v: 7,
                            w: 300)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
