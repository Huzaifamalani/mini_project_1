import 'package:e_commerce_app/screens/constant.dart';
import 'package:e_commerce_app/screens/onbroading_screen/widget/button.dart';
import 'package:e_commerce_app/styles/colors.dart';
import 'package:flutter/material.dart';

class OnbroadingScreen extends StatefulWidget {
  const OnbroadingScreen({super.key});

  @override
  State<OnbroadingScreen> createState() => _OnbroadingScreenState();
}

class _OnbroadingScreenState extends State<OnbroadingScreen> {
  int activePage = 0;
  final PageController pageController = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: CustColors.lightBlue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 30),
          child: Column(
            children: [
              Container(
                // color: Colors.red,
                child: SizedBox(
                  height: height * 0.35,
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      setState(() {
                        activePage = index;
                      });
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 35, right: 35),
                        child: Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your holiday",
                                style: CustomStyle.headerBold,
                              ),
                              Text(
                                "shopping",
                                style: CustomStyle.headerBold,
                              ),
                            Text(
                                'delivered to Screen',
                                style: CustomStyle.headerBold,
                                ),
                                Text(
                                'one',
                                style: CustomStyle.headerBold,
                                ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                'There\'s something for everyone',
                              style: CustomStyle.labeltext,
                              ),
                              Text(
                                'to enjoy with Sweet Shop',
                                style: CustomStyle.labeltext,
                                ),
                              Text(
                                "Favourites Screen 1",
                                style: CustomStyle.labeltext,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35, right: 35),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your holiday",
                                style: CustomStyle.headerBold,
                              ),
                              Text(
                                "shopping",
                                style: CustomStyle.headerBold,
                              ),
                            Text(
                                'delivered to Screen',
                                style: CustomStyle.headerBold,
                                ),
                                Text(
                                'two',
                                style: CustomStyle.headerBold,
                                ),
                               SizedBox(
                                height: 20,
                              ),
                              Text(
                                'There\'s something for everyone',
                              style: CustomStyle.labeltext,
                              ),
                              Text(
                                'to enjoy with Sweet Shop',
                                style: CustomStyle.labeltext,
                                ),
                              Text(
                                "Favourites Screen 2",
                                style: CustomStyle.labeltext,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 35),
                child: Row(
                  children: List.generate(
                      2,
                      (index) => Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: activePage == index
                                      ? CustColors.black1
                                      : CustColors.black45,
                                  borderRadius: BorderRadius.circular(2)),
                            ),
                          )),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  child: Image.asset(
                    'assets/groceryimage.png',
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
              Spacer(),
              SizedBox(
                height: height * 0.08,
                width: width * 0.65,
                child: const Custom1stButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
