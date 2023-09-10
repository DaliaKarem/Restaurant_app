import 'package:flutter/material.dart';

class TrendingFood extends StatefulWidget {
  const TrendingFood({Key? key}) : super(key: key);

  @override
  State<TrendingFood> createState() => _TrendingFoodState();
}

class _TrendingFoodState extends State<TrendingFood> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                Image.network("https://media.istockphoto.com/id/1142277472/photo/pizza-slice-melted-cheese.jpg?s=612x612&w=0&k=20&c=A-4fSg0RvB1Jklaa48g_O1Q1JbemJ-oQDxzmc2A43mA=",width: 100,height: 100,),
                Positioned(left: 0,top: 0,child: Container(color: Colors.yellow,child: Text("5% off"),width: 50,height: 20,))
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Dal Tadka",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
              Container(
                width: 250,
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  'It is a long established fact that a reader will be gggggggggg ggggggggg.',
                  style: TextStyle(fontSize: 10),
                  softWrap: false,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis, // new
                ),
              ),
              TextButton(onPressed: (){}, child: Text("Read more")),
            ],
          ),

        ],
      ),
    );
  }
}
