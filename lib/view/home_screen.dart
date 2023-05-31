import 'dart:convert';

import 'package:dumy_project/constants/colors.dart';
import 'package:dumy_project/constants/images.dart';
import 'package:dumy_project/constants/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Model/products_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<ProductApiModel> productFun() async {
    var response =
        await http.get(Uri.parse("https://api.disneyapi.dev/character"));

    var data = jsonDecode(response.body.toString());
    if (kDebugMode) {
      print(data);
    }

    if (response.statusCode == 200) {
      return ProductApiModel.fromJson(data);
    }
    return ProductApiModel.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.orange,
          title: const Text("Dumy Project"),
        ),
        body: FutureBuilder(
            future: productFun(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.data.length,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.lightOrange,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Container(
                                          height: 140,
                                          width: 120,
                                          decoration: BoxDecoration(
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                    AppImages.javaProgramming,
                                                  ),
                                                  fit: BoxFit.fill),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          10.ph,
                                          Text(
                                            snapshot.data!.data[index].name
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          10.ph,
                                          Text(
                                            snapshot.data!.data[index].createdAt
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ));
                    });
              }
            }));
  }
}
