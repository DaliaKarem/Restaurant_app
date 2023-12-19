import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restaurantapp/core/const/color.dart';
import 'package:restaurantapp/view/widget/Shared/largetext.dart';

class ImageContainer extends StatelessWidget {
  ImageContainer({Key? key, this.onTap}) : super(key: key);
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.separated(
        separatorBuilder: (Build, i) {
          return SizedBox(
            height: 30,
          );
        },
        scrollDirection: Axis.horizontal,
        itemBuilder: (build, index) {
          return ContainerOfTreding(
              onTap: onTap,
              title: "Chicke with Rice",
              des: "rfnrn jnrfn jgjrjn jgnjrngjn jjrnfjnr rj",
              img:
              "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D");
        },
        itemCount: 5,
      ),
    );
  }
}

class ContainerOfTreding extends StatelessWidget {
  ContainerOfTreding(
      {Key? key,
        required this.onTap,
        required this.title,
        required this.des,
        required this.img})
      : super(key: key);
  Function()? onTap;
  String title, des, img;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 400,
          width: 300,
          decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                img,
                width: double.infinity,
                height: 100,
                fit: BoxFit.fill,
              ),
              LargeText(
                text: title,
                fontSize: 17,
              ),
              LargeText(
                text: des,
                fontSize: 15,
                color: Colors.grey.shade400,
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemSize: 20,
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}