import 'package:flutter/material.dart';
import 'package:gym_one/const/color.dart';
import 'package:lottie/lottie.dart';

class ContainerShape extends StatelessWidget {
  String image;
  String trainName;
  int count;
ContainerShape({required this.image, required this.trainName, required this.count});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: const  BoxDecoration(
          color: Color.fromRGBO(245, 245, 245, 1),
            borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        child: Column(
          children: [
            Lottie.network(image,
                fit: BoxFit.cover,
                height:135),
            Text(trainName,style: TextStyle(fontWeight: FontWeight.bold,color: PrimaryColorr),),
            SizedBox(height: 5),
            Text("Program ${count}")
          ],
        ),
      ),
    )
    ;
  }
}
