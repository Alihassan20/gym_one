import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_one/widgets/container_shap.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../const/color.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    int _curr = 0;

    List<Widget> trainingList = [
      ContainerShape(image: 'https://assets6.lottiefiles.com/packages/lf20_iegqiiek.json', trainName: 'Warm-Up Experiance', count: 10),
      ContainerShape(image: 'https://assets9.lottiefiles.com/packages/lf20_p8uh9orq.json', trainName: 'Yoga', count: 12),
      ContainerShape(image: 'https://assets4.lottiefiles.com/packages/lf20_4ahuym9s.json', trainName: 'Stretching', count: 12),
      ContainerShape(image: 'https://assets7.lottiefiles.com/packages/lf20_iomgwryc.json', trainName: 'Cardio', count: 30),
      ContainerShape(image: 'https://assets7.lottiefiles.com/packages/lf20_Pkg2zS.json', trainName: "BodySpecial", count: 10),
      ContainerShape(image: 'https://assets7.lottiefiles.com/packages/lf20_n1oyepxw.json', trainName: 'Trainer', count: 12),
    ];
    ScrollController scollBarController = ScrollController(initialScrollOffset: 50.0);

    return Scaffold(
      appBar: AppBar(
        title: Text('O N E 🔥 G Y M'),
        centerTitle: true,
        elevation: 5,
        shadowColor: Colors.black,
        backgroundColor: PrimaryColorr.withOpacity(0.8),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight:Radius.circular(15) )
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 200,
                        child: PageView(
                            children: trainingList,
                            scrollDirection: Axis.horizontal,
                            // reverse: true,
                            physics: const BouncingScrollPhysics(),
                            controller: controller,
                            onPageChanged: (num) {
                              setState(() {
                                _curr = num;
                              });
                            })),
                  ),
              const SizedBox(height: 5),
        SmoothPageIndicator(
          controller: controller,
          count:trainingList.length ,
          // effect:  widget.effect,
          effect: const WormEffect(
            dotHeight: 10,
            dotWidth: 10,
            type: WormType.thin,
            strokeWidth: 5,
          )),
              const SizedBox(height: 5),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                  child: Scrollbar(
                    controller: scollBarController,
                    thickness: 3,
                    trackVisibility:true,
                    showTrackOnHover:true,
                    interactive:true,
                    radius: const Radius.circular(50),
                    isAlwaysShown: true,
                    child: GridView.count(
                        crossAxisCount: 2,
                        children: trainingList
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),


            ],
          ),
        ),
      )
      
    );
  }
}
