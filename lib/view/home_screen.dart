// ignore_for_file: library_private_types_in_public_api

import 'package:dumy_project/constants/colors.dart';
import 'package:dumy_project/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product_api_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);

    // Fetch initial set of products
    ProductApiProvider productApiProvider =
        Provider.of<ProductApiProvider>(context, listen: false);
    productApiProvider.fetchProducts();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      // Reached the end of the list, load more data
      ProductApiProvider productApiProvider =
          Provider.of<ProductApiProvider>(context, listen: false);
      productApiProvider.loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    ProductApiProvider productApiProvider =
        Provider.of<ProductApiProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.orange,
        title: const Text("Dummy Project"),
      ),
      body: Consumer<ProductApiProvider>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: productApiProvider.products.length + 1,
            itemBuilder: (context, index) {
              if (index == productApiProvider.products.length) {
                // Show loading indicator at the end
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(
                      color: AppColors.orange,
                    ),
                  ],
                );
              } else {
                final product = productApiProvider.products[index];
                return Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  height: 140,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(product.imageUrl),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  10.ph,
                                  Text(
                                    product.name,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  10.ph,
                                  Text(
                                    product.createdAt.toString(),
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
            controller: _scrollController,
          );
        },
      ),
    );
  }
}
