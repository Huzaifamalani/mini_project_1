import 'package:e_commerce_app/screens/add_to_cart.dart/cart_screen.dart';
import 'package:e_commerce_app/styles/colors.dart';
import 'package:e_commerce_app/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'package:e_commerce_app/product_Data.dart';
import '../onboard_screens/widget/cust_text_botton.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class ProductScreen extends StatefulWidget {
  final int indexForItem;
  final int? indexForCatItem;
  final String fromScreen;

  ProductScreen(
      {super.key,
      required this.indexForItem,
      this.indexForCatItem,
      required this.fromScreen});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final controller = PageController();

  // get indexForItem => indexForItem;
  @override
  Widget build(BuildContext context) {
    int itForInd = widget.indexForItem;
    int? itforInd2 = widget.indexForCatItem;
    String fromScreen = widget.fromScreen;
    List countCond = fromScreen == "homeScreen"
        ? prodsImgs[widget.indexForItem]
        : categories[itForInd][itforInd2]['images'];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const CircleAvatar(
                    backgroundColor: CustColors.black10,
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: CustColors.black100,
                      size: 18,
                    ),
                  ),
                ),
                Container(
                  // color: CustColors.black90,
                  height: 230,
                  width: 230,
                  child: PageView.builder(
                    itemCount: countCond.length,
                    controller: controller,
                    itemBuilder: (context, index) {
                      if (fromScreen == "homeScreen") {
                        return GestureDetector(
                          onTap: () {
                            // print("im circle $index");
                            // print("index from previous $itForInd");
                            // print("index from catInd $itforInd2");
                            // print("ind count from cat ");
                            // print("${categories[itForInd][itforInd2]["title"]}");
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: CustColors.black45,
                              // borderRadius: BorderRadius.circular(8),
                            ),
                            child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(0, 29, 52, 71),
                              foregroundImage: NetworkImage(
                                  "${prodsImgs[widget.indexForItem][index]}",
                                  scale: 0.1),
                            ),
                          ),
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            print("im circle $index");
                            print("index from previous $itForInd");
                            print("index from catInd $itforInd2");
                            // print("${categories[itForInd][itforInd2]["title"]}");
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: CustColors.black45,
                              // borderRadius: BorderRadius.circular(8),
                            ),
                            child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(0, 29, 52, 71),
                              foregroundImage: AssetImage(
                                  "${categories[itForInd][itforInd2]['images'][index]}",
                                  ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  // color: CustColors.black60,
                  height: 50,
                  width: 50,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddToCartScreen()));
                    },
                    child: Stack(
                      children: [
                        const Positioned(
                          bottom: 12,
                          left: 12,
                          child: Icon(
                            IconlyLight.bag,
                            // color: CustColors.black1,
                          ),
                        ),
                        if (cartItems.isEmpty) Container(),
                        if (cartItems.isNotEmpty)
                          Positioned(
                            top: 4,
                            right: 6,
                            child: CircleAvatar(
                              backgroundColor: CustColors.lightYellow,
                              radius: 12,
                              child: Text(
                                "${cartItems.length}",
                                style: Label.Medium12px.copyWith(
                                    color: CustColors.black1),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            SmoothPageIndicator(
              controller: controller,
              count: countCond.length,
              effect: const WormEffect(
                dotHeight: 3,
                dotWidth: 30,
                type: WormType.underground,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                if (fromScreen == "homeScreen")
                  Container(
                    width: MediaQuery.of(context).size.width * .9,
                    child: Text(
                      "${products[widget.indexForItem]["title"]}",
                      style: Heading4.Bold18px,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                if (fromScreen == "categoryScreen")
                  Container(
                    // color: CustColors.lightYellow,
                    width: MediaQuery.of(context).size.width * .9,
                    child: Text(
                      "${categories[itForInd][itforInd2]["title"]}",
                      style: Heading4.Bold18px,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //
                // for price , discount, and reg
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (fromScreen == "homeScreen")
                      Text(
                        "\$${products[widget.indexForItem]["price"]}",
                        style: Body1.SemiBold16px.copyWith(
                            color: CustColors.lightBlue),
                      ),
                    if (fromScreen == "categoryScreen")
                      Text(
                        "\$${categories[itForInd][itforInd2]["price"]}",
                        style: Heading4.Bold18px,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    const SizedBox(
                      width: 20,
                    ),
                    if (fromScreen == "homeScreen")
                      Container(
                        width: 100,
                        height: 25,
                        decoration: BoxDecoration(
                          color: CustColors.lightBlue,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            "${products[widget.indexForItem]["discountPercentage"]}% off",
                            style: Label.Medium12px.copyWith(
                                color: CustColors.black1),
                          ),
                        ),
                      ),
                    if (fromScreen == "categoryScreen")
                      Container(
                        width: 100,
                        height: 25,
                        decoration: BoxDecoration(
                          color: CustColors.lightBlue,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            "${categories[itForInd][itforInd2]["discountPercentage"]}% off",
                            style: Label.Medium12px.copyWith(
                                color: CustColors.black1),
                          ),
                        ),
                      ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Reg : 70.32 USD",
                      style:
                          Label.Medium12px.copyWith(color: CustColors.black20),
                      softWrap: true,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),

            //for star icon and review label
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.star, color: CustColors.lightYellow),
                const Icon(Icons.star, color: CustColors.lightYellow),
                const Icon(Icons.star, color: CustColors.lightYellow),
                const Icon(Icons.star, color: CustColors.lightYellow),
                const Icon(
                  Icons.star_half_sharp,
                  fill: 1,
                  color: CustColors.lightYellow,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "110 Reviews",
                  style: Label.Regular12px.copyWith(color: CustColors.black20),
                ),
              ],
            ),            
            const SizedBox(
              height: 8,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .31,
                  // color: CustColors.black60,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Details",
                          style: Heading4.SemiBold18px.copyWith(
                              color: CustColors.black100),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        if (fromScreen == "homeScreen")
                          Text(
                            "${products[widget.indexForItem]["description"]}",
                            textAlign: TextAlign.justify,
                            style: Body2.Medium14px.copyWith(),
                          ),
                        if (fromScreen == "categoryScreen")
                          Text(
                            "${categories[itForInd][itforInd2]["description"]}",
                            textAlign: TextAlign.justify,
                            style: Body2.Medium14px.copyWith(),
                          ),
                        const SizedBox(
                          height: 20,
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          separatorBuilder: (context, index) {
                            return Container(
                              height: 1.5,
                              width: double.infinity,
                              color: CustColors.black100,
                            );
                          },
                          itemBuilder: (context, index) {
                            return ExpansionTile(
                              title: const Text("Nutritional facts"),
                              
                            );
                          },
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          separatorBuilder: (context, index) {
                            return Container(
                              height: 1.5,
                              width: double.infinity,
                              color: CustColors.black100,
                            );
                          },
                          itemBuilder: (context, index) {
                            return ExpansionTile(
                              title: const Text("Reviews"),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //
                // without bg color
                CustTextButton(
                  title: 'Add to Cart',
                  textStyle:
                      Body2.Medium14px.copyWith(color: CustColors.lightBlue),
                  buttonStyle: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(
                      Size(MediaQuery.of(context).size.width * .4, 60),
                    ),
                    backgroundColor:
                        const MaterialStatePropertyAll(CustColors.black1),
                    side: const MaterialStatePropertyAll(
                      BorderSide(
                        width: 2,
                        color: CustColors.lightBlue,
                      ),
                    ),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      cartItems.add(products[widget.indexForItem]);
                      print(cartItems);
                    });
                  },
                ),
                //
                // with bg color
                CustTextButton(
                  title: 'Buy Now',
                  textStyle:
                      Body2.Medium14px.copyWith(color: CustColors.black1),
                  buttonStyle: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(
                      Size(MediaQuery.of(context).size.width * .46, 60),
                    ),
                    backgroundColor:
                        const MaterialStatePropertyAll(CustColors.lightBlue),
                    side: const MaterialStatePropertyAll(
                      BorderSide(
                        width: 2,
                        color: CustColors.lightBlue,
                      ),
                    ),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}