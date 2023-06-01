import 'package:ecom_cf_session/modals/product_modal.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  double totalAmount = 0;

  @override
  void initState() {
    super.initState();

    cartItems.forEach((element) {
      totalAmount += element['price'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CartPage"),
        centerTitle: true,
      ),
      body: cartItems.isEmpty
          ? Center(
              child: const Text("Cart is empty !!"),
            )
          : Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  ...cartItems
                      .map(
                        (e) => ListTile(
                          title: Text(e['title']),
                          subtitle: Text(e['price'].toString()),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                cartItems.remove(e);
                                totalAmount -= e['price'];
                              });
                            },
                          ),
                        ),
                      )
                      .toList(),
                  const Spacer(),
                  ListTile(
                    title: Text(
                      "Total amount: ",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    tileColor: Colors.red,
                    trailing: Text(
                      "$totalAmount",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
