import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_one/const/color.dart';
import 'package:gym_one/core/new_route.dart';
import 'package:gym_one/feature/home/view.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget  {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {

  AnimationController? _caffeController;

  bool animatrdCaffe = false;

  @override
  void initState() {
    _caffeController = AnimationController(vsync: this);
    _caffeController!.addListener(() {
      if(_caffeController!.value>0.99){
        _caffeController!.stop();
        animatrdCaffe = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _caffeController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var hight= MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:animatrdCaffe?PrimaryColorr:Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 2),
              height:animatrdCaffe?hight/1.9:hight ,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight:Radius.circular(20) )
              ),
              child: Column(
                children: [
                  Visibility(
                    visible: !animatrdCaffe
                    ,child: Center(
                      child: Lottie.asset('assets/image/23953-kaizen-gym-animation.zip',
                        width: double.infinity,
                        controller: _caffeController,
                        onLoaded: (composition){
                          _caffeController!..duration = composition.duration..forward();
                        }
                  ),
                    ),
                  ),
                  Visibility(
                      visible: animatrdCaffe,
                      child: AnimatedContainer(
                        duration: const Duration(microseconds: 500),
                        child: Image.asset("assets/image/GYM.PNG",
                          width: double.infinity,
                        ),
                      )),
                  Visibility(
                    visible: animatrdCaffe,
                    child: AnimatedTextKit(animatedTexts: [
                      RotateAnimatedText('O N E 🔥 G Y M',
                          transitionHeight: 50,
                          textStyle:  TextStyle(
                              fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: PrimaryColorr,

                              )),],
                      repeatForever: true,
                    ),
                  )            ],
              ),
            ),
            Visibility(

              visible: animatrdCaffe,
              child: Align(

                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Welcome To ONE GYM',
                        style: TextStyle(
                            fontSize: 27.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),

                      ),
                      const SizedBox(height: 30.0),
                      const Text(
                        'Train Insane or Remain the Same. ',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 50.0),
                      GestureDetector(
                        onTap: (){
                          print("alolo");
                          MagicRouter.navigateAndPopAll(Home());
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 85.0,
                            width: 85.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2.0),
                            ),
                            child: const Icon(
                              Icons.chevron_right,
                              size: 50.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50.0),
                    ],
                  ),
                ),
              ),
            )
          ],

        ),
      ),
    );
  }
}
