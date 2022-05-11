// ignore_for_file: file_names
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:shop_app/Modules/Login/LoginScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
  static final ROUTE_NAME = 'OnBoarding';
}

class _OnBoardingState extends State<OnBoarding> {
  var boardController = PageController();
  bool isLast = false;

  List<onBoardingModel> screen = [
    onBoardingModel(
        image: "assets/introduction.png",
        title: 'Screen Title 1 ',
        body: 'Screen Body 1'),
    onBoardingModel(
        image: "assets/introductionTwo.png",
        title: 'Screen Title 2 ',
        body: 'Screen Body 2'),
    onBoardingModel(
        image: "assets/introthree.png",
        title: 'Screen Title 3 ',
        body: 'Screen Body 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(onPressed: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen(),), (route) => false);
          }, child: Text('SKIP'))
        ],
      ),
        body: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: boardController,
              onPageChanged: (int index ){
                if (index == screen.length -1)
                  {
                    setState(() {
                      isLast=true;
                    });
                  }else{
                  setState(() {
                    isLast=false;
                  });
                }
              },
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildBoardingItem(screen[index]),
              itemCount: screen.length,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              SmoothPageIndicator(
                controller: boardController,
                effect: ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  dotHeight: 10,
                  dotWidth: 10,
                  expansionFactor: 4.0,
                  spacing: 5.0,
                  activeDotColor: Colors.deepOrange

                ),
                count: screen.length,
              ),
              Spacer(),
              FloatingActionButton(
                onPressed: () {
                  if(isLast){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()),(route)=>false );
                  }
                  boardController.nextPage(
                      duration: Duration(milliseconds: 750),
                      curve: Curves.fastLinearToSlowEaseIn);

                },
                child: Icon(Icons.arrow_right_alt_outlined),
              )
            ],
          ),
        ],
      ),
    ));
  }

  Column buildBoardingItem(onBoardingModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Image(image: AssetImage('${model.image}'))),
        Text(
          '${model.title} ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '${model.body} ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
    );
  }
}

class onBoardingModel {
  final String image;
  final String title;
  final String body;

  onBoardingModel(
      {required this.image, required this.title, required this.body});
}
