import 'package:flutter/material.dart';
import 'package:food_app/controllers/product_controller.dart';
import 'package:food_app/network/product_service.dart';
import 'package:food_app/utils/colors.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProductController _productController;

  List<int> counter = [];

  void increment(int index) {
    setState(() {
      counter[index]++;
    });
  }

  void decrement(index) {
    setState(() {
      if (counter[index] > 0) {
        counter[index]--;
      }
    });
  }

  @override
  void initState() {
    _productController = Get.put(ProductController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
        backgroundColor: BG_COLOR,
      ),
      body: Obx(() {
        if (_productController.loader.value == true) {
          return Center(
            child: CircularProgressIndicator(color: Colors.indigo),
          );
        } else {
          return GridView.builder(
              itemCount: _productController.productList.value.popular!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 3.3,
              ),
              itemBuilder: (context, index) {
                counter.add(1);
                var data = _productController.productList.value.popular![index];
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3,
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(13),
                            child: Image.network(
                              data.image!.thumbnail.toString(),
                              fit: BoxFit.fill,
                              height: 100,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            data.name.toString(),
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "BDT ${data.price}",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  increment(index);
                                  _productController.updatePrice(
                                      index, counter[index]);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.indigo,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  //color: Colors.indigo,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "${counter[index]}",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              InkWell(
                                onTap: () async {
                                  decrement(index);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.indigo,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.minimize,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        }
      }),
    );
  }
}
