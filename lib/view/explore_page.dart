import 'package:e_comerce_app/styles/colors.dart';
import 'package:e_comerce_app/view/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/home_view_model.dart';
import '../widgets/app_text.dart';
import 'searchview.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: GetBuilder<HomeViewModel>(
        init: Get.put(HomeViewModel()),
        builder: (controller) => controller.loading
            ? const Center(
                child: CircularProgressIndicator(color: primaryColor),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Hi ',
                              style: TextStyle(
                                  fontFamily: 'pacifico', fontSize: 20),
                            ), Text(
                             // name!,
                              'Ther',
                              style: TextStyle(
                                  fontFamily: 'pacifico', fontSize: 20,color: primaryColor),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 49,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                          onFieldSubmitted: (value) {
                            Get.to(SearchView(value));
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const HomeBanner(),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:  [
                            AppText(
                              text: 'Best Seling',
                              color: blackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            Spacer(),
                            AppText(
                              text: 'See All',
                              color: primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const ListViewProducts(),
                      const SizedBox(
                        height: 15,
                      ),
                       AppText(
                        text: 'Categories',
                        color: blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const ListViewCategories(),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:  [
                            AppText(
                              text: 'Top Quality',
                              color: blackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            Spacer(),
                            AppText(
                              text: '10',
                              color: primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const ListViewProducts(),
                    ],
                  ),
                ),
              ),
      ),
    ));
  }
}

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 115,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
              image: AssetImage(
                "assets/images/banner_background.png",
              ),
              fit: BoxFit.cover)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Image.asset(
              "assets/images/banner_image.png",
              height: 100,
              width: 100,
            ),
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              AppText(
                text: "New Products",
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              AppText(
                text: "Get Up To 40%  OFF",
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}

class ListViewProducts extends StatelessWidget {
  const ListViewProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        builder: (controller) =>SizedBox(
      height: 270,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
           itemCount: controller.products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
                 Get.to(ProductDetailView(controller.products[index]),);
            },
            child: Container(
              color: Colors.grey.shade200,
              width: 164,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.grey.shade200,
                    ),
                    height: 200,
                    width: 164,
                    child: Image.network(
                        controller.products[index].image,
                           fit: BoxFit.cover,
                         ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        AppText(
                          text: controller.products[index].name,
                          fontSize: 16,
                        ),
                        AppText(
                          text:controller.products[index].description,
                          fontSize: 12,
                          color: Colors.grey,
                          maxLine: 1,
                        ),
                        AppText(
                          text: '\$ ${controller.products[index].price}',
                          fontSize: 16,
                          color: primaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 15,
          );
        },
      ),
    ));
  }
}

class ListViewCategories extends StatelessWidget {
  const ListViewCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child:GetBuilder<HomeViewModel>(
        builder: (controller) => ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade200,
                    ),
                    height: 70,
                    width: 70,
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child:    Image.network(
                       controller.categories[index].image,
                         fit: BoxFit.cover,
                        ),
                    ),
                  ),
                ),
                 AppText(
               text: controller.categories[index].name,
                   fontSize: 12,
                   fontWeight: FontWeight.bold,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 20,
          );
        },
      ),
    ));
  }
}
