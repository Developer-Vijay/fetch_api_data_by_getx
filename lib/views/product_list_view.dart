import 'package:fetch_api_data/constants/app_color.dart';
import 'package:fetch_api_data/constants/app_strings.dart';
import 'package:fetch_api_data/productmodule/controllers/product_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProductListView extends StatelessWidget {
  ProductListView({Key? key}) : super(key: key);
  ProductConroller productConroller = Get.put(ProductConroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.productList),
      ),
      body: Obx(() {
        if (productConroller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: productConroller.productList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 150,
                        width: 100,
                        margin:
                            const EdgeInsets.fromLTRB(16, 8, 8, 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            productConroller
                                .productList[index].imageLink,
                            width: 150,
                            height: 150,
                            fit: BoxFit.fill,
                            color: AppColor.orangeColor,
                            colorBlendMode: BlendMode.color,
                          ),
                        ),
                      ),
                      Flexible(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productConroller.productList[index].brand,
                            style: const TextStyle(
                                fontSize: 14, color: AppColor.grey),
                          ),
                          Text(
                            productConroller
                                .productList[index].category,
                            style: const TextStyle(
                                fontSize: 14, color: AppColor.grey),
                          )
                        ],
                      ))
                    ],
                  ),
                  Container(
                    color: AppColor.grey200,
                    height: 2,
                  )
                ],
              );
            },
          );
        }
      }),
    );
  }
}
