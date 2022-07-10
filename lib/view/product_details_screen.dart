import 'package:e_comerce_app/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/cart_viewmodel.dart';
import '../model/cart_model.dart';
import '../model/product_model.dart';
import '../styles/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/favorite_toggleIcon.dart';

class ProductDetailView extends StatelessWidget {

  final ProductModel _productModel;

  ProductDetailView(this._productModel);

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          SizedBox(
                            height: 196,
                            width: double.infinity,
                            child: Image.network(
                             _productModel.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                           IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                              ),
                            ),
                        ],
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: Column(
                          children: [
                            AppText(
                              alignment: Alignment.centerLeft,
                              text:_productModel.name,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Container(
                                   alignment: Alignment.centerLeft,
                                    height: 42,
                                   // width: 200,
                                   decoration: BoxDecoration(
                                     border: Border.all(color: Colors.grey.shade400),
                                     borderRadius: BorderRadius.circular(15),
                                   ),
                                   child:Padding(
                                     padding: const EdgeInsets.all(5.0),
                                     child: AppText(text: 'Add To Favorite:',maxLine: 2,),
                                   ) ,
                                  ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: 42,
                                  // width: 200,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FavoriteToggleIcon(
                                    ),
                                  ) ,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 33,
                            ),
                            AppText(
                              alignment: Alignment.centerLeft,
                              text: 'Details:',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            AppText(
                              alignment: Alignment.topLeft,
                              text:_productModel.description,
                              fontSize: 14,
                              hight: double.maxFinite,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Material(
              elevation: 12,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: 'PRICE',
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        AppText(
                          text: '\$${_productModel.price}',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ],
                    ),GetBuilder<CartViewModel>(
                      init: CartViewModel(),
                      builder: (controller) => Container(
                        width: 146,
                        child: CustomButon(text: 'ADD',onTap:  () {
                          controller.addProduct(
                            CartModel(
                              name: _productModel.name,
                              image: _productModel.image,
                              price: _productModel.price,
                              productId: _productModel.productId,
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

