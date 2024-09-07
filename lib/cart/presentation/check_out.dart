import 'package:flutter/material.dart';
import 'package:module13_assignment/cart/widget/custom_button.dart';
import 'package:module13_assignment/cart/widget/custom_text.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  List<Map> productsDetail = [
    {
      "title": "Pullover",
      "color": "Black",
      "size": "L",
      "price": "51",
      "quantity": 1
    },
    {
      "title": "T-Shirt",
      "color": "Gray",
      "size": "L",
      "price": "30",
      "quantity": 1
    },
    {
      "title": "Sports Dress",
      "color": "Black",
      "size": "M",
      "price": "43",
      "quantity": 1
    }
  ];
  // int pricePerPrice = 51;
  // int productCount = 1;
  // int totalPricePerProduct = 0;

  int totalAmount = 0;
  double getTotalAmount() {
    double total = 0;
    for (var item in productsDetail) {
      total += double.parse(item["price"]) * item["quantity"];
    }
    return total;
  }

  void incrementQuantity(int index) {
    setState(() {
      productsDetail[index]["quantity"]++;
      print(productsDetail[index]["quantity"]);
    });
  }

  void decrementQuantity(int index) {
    if (productsDetail[index]["quantity"] > 1) {
      setState(() {
        productsDetail[index]["quantity"]--;
        print(productsDetail[index]["quantity"]);
      });
    }
  }

  void checkout() {
    final snackBar =
        SnackBar(content: Text('Congratulations! Checkout successful.'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "My Bag",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 238, 237, 237),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    int pricePerPrice =
                        int.parse(productsDetail[index]["price"]);
                    int productCount = 1;
                    int totalPricePerProduct = pricePerPrice;
                    totalAmount = totalAmount + totalPricePerProduct;
                    return Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(top: 12),
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.asset(
                              "assets/images/image.jpg",
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${productsDetail[index]["title"]}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      "Color:",
                                      color: Colors.grey,
                                    ),
                                    CustomText(
                                      "${productsDetail[index]["color"]}",
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    CustomText(
                                      "Size:",
                                      color: Colors.grey,
                                    ),
                                    CustomText(
                                      "${productsDetail[index]["size"]}",
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        decrementQuantity(index);
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 3,
                                                spreadRadius: 0.5,
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.grey,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CustomText(
                                      "${(productsDetail[index]["quantity"]).toStringAsFixed(0)}",
                                      isBold: true,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        incrementQuantity(index);
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 3,
                                                spreadRadius: 0.5,
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.grey,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.more_vert_outlined,
                                  color: Colors.grey,
                                ),
                                CustomText(
                                  "${(double.parse(productsDetail[index]["price"]) * productsDetail[index]["quantity"]).toStringAsFixed(0)}\$",
                                  color: Colors.black,
                                  isBold: true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total amount:",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                Text(
                  "${getTotalAmount().toStringAsFixed(0)}\$",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              text: "Check Out",
              onTap: checkout,
            ),
          ],
        ),
      ),
    );
  }
}
