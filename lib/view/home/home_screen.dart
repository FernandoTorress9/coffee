import 'package:coffee/controller/btm_nav_controller.dart';
import 'package:coffee/controller/products_controller.dart';
import 'package:coffee/view/home/widgets/product_card.dart';
import 'package:coffee/view/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController _textEditingController = TextEditingController();
  final ProductsController _productsController = Get.find<ProductsController>();
  final BottomNavigationBarController _indexController =
      BottomNavigationBarController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      _productsController.fetchData();
    });
    return LayoutBuilder(
      builder: (context, constraints) {
        print(constraints.maxWidth);
        return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              backgroundColor: const Color.fromRGBO(47, 47, 47, 1.0),
              leading: constraints.maxWidth > constraints.maxHeight
                  ? IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                      icon: const Icon(
                        Icons.filter_list_outlined,
                        color: Colors.grey,
                      ))
                  : null,
              elevation: 0,
              actions: [
                IconButton(
                    onPressed: () {
                      Get.toNamed(RoutesNames.cart);
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.grey,
                    ))
              ],
            ),
            drawer: constraints.maxWidth > constraints.maxHeight
                ? Container(
                    color: Colors.white,
                    child: Obx(() => SizedBox(
                      width: constraints.maxWidth/4,
                      child: Column(

                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.home,
                                    color:
                                        _indexController.currentIndex.value == 0
                                            ? Colors.orange
                                            : Colors.black,
                                  ),
                                  onPressed: () {
                                    _indexController.currentIndex.value = 0;
                                    _scaffoldKey.currentState!.closeDrawer();
                                  }),
                              IconButton(
                                  icon: Icon(Icons.favorite,
                                      color:
                                          _indexController.currentIndex.value == 1
                                              ? Colors.orange
                                              : Colors.black),
                                  onPressed: () {
                                    _indexController.currentIndex.value = 1;
                                    _scaffoldKey.currentState!.closeDrawer();
                                  }),
                              IconButton(
                                  icon: Icon(
                                    Icons.notifications,
                                    color:
                                        _indexController.currentIndex.value == 2
                                            ? Colors.orange
                                            : Colors.black,
                                  ),
                                  onPressed: () {
                                    _indexController.currentIndex.value = 2;
                                    _scaffoldKey.currentState!.closeDrawer();
                                  }),
                              IconButton(
                                  icon: Icon(
                                    Icons.person,
                                    color:
                                        _indexController.currentIndex.value == 3
                                            ? Colors.orange
                                            : Colors.black,
                                  ),
                                  onPressed: () {
                                    _indexController.currentIndex.value = 3;
                                    _scaffoldKey.currentState!.closeDrawer();
                                  }),
                            ],
                          ),
                    )),
                  )
                : null,
            bottomNavigationBar: constraints.maxWidth > constraints.maxHeight
                ? null
                : Obx(() => BottomNavigationBar(
                      currentIndex: _indexController.currentIndex.value,
                      type: BottomNavigationBarType.fixed,
                      backgroundColor: const Color.fromRGBO(47, 47, 47, 1.0),
                      selectedItemColor: Colors.orange,
                      unselectedItemColor: Colors.grey,
                      onTap: (index) {
                        _indexController.currentIndex.value = index;
                      },
                      items: const [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home), label: ""),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.favorite), label: ""),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.notifications), label: ""),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.person), label: ""),
                      ],
                    )),
            backgroundColor: const Color.fromRGBO(47, 47, 47, 1.0),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'It\'s a great day for coffee',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: TextField(
                      controller: _textEditingController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color.fromRGBO(101, 101, 101, 1.0),
                          ),
                          hintText: 'Find you coffee',
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(101, 101, 101, 1.0)),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Color.fromRGBO(68, 68, 68, 1.0)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultTabController(
                    length: 3,
                    child: Expanded(
                      child: Column(
                        children: [
                          const TabBar(
                              indicatorWeight: 2,
                              indicatorColor: Colors.orange,
                              unselectedLabelColor: Colors.grey,
                              labelColor: Colors.orange,
                              tabs: [
                                Tab(
                                  text: 'Hot Coffee',
                                ),
                                Tab(
                                  text: 'Hot Coffee',
                                ),
                                Tab(
                                  text: 'Hot Coffee',
                                )
                              ]),
                          Expanded(
                            child: TabBarView(children: [
                              Obx(() {
                                print(
                                    'isVisible : ${_productsController.isVisible.value}');
                                if (_productsController.isLoading.value) {
                                  return  Row(
                                    children:const [
                                      Spacer(),
                                      CircularProgressIndicator(),
                                      Spacer()
                                    ],
                                  );
                                } else {
                                  return GridView.builder(
                                    itemCount: _productsController.products.length,
                                    gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio:
                                        constraints
                                            .maxWidth >
                                            1100
                                            ? 1 / 0.8
                                            : 1 / 1.2,
                                        crossAxisCount: getCrossAxisCount(
                                            constraints.maxWidth)),
                                    itemBuilder: (context, index) {
                                      final item = _productsController.products[index];
                                      return AnimatedOpacity(
                                        opacity:
                                        _productsController.isVisible.value ? 1 : 0,
                                        duration: Duration(milliseconds: 500 * index),
                                        child: ProductCard(
                                            item: item,
                                            onClick: () {
                                              Get.toNamed(RoutesNames.showDetails,
                                                  arguments: item);
                                            },
                                            onAddClick: () {
                                              if (item.isAddedToCart) {
                                                _productsController
                                                    .removeFromCart(item);
                                              } else {
                                                _productsController.addToCart(item);
                                              }
                                            }),
                                      );
                                    },
                                  );
                                }
                              }),
                              SizedBox(),
                              SizedBox()
                            ]),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }

  int getCrossAxisCount(double width) {
    if (width < 300) {
      return 1;
    } else if (width < 451) {
      return 2;
    } else if (width >= 451 && width < 735) {
      return 3;
    } else if (width >= 735) {
      return 4;
    } else {
      return 5;
    }
  }
}
