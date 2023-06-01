import 'package:ecom_cf_session/modals/helpers/adhelper.dart';
import 'package:ecom_cf_session/modals/product_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCategory;
  double sliderVal = 0;

  @override
  void initState() {
    super.initState();

    AdHelper.adHelper.loadBannerAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed('page1')
                  .then((value) => setState(() {}));
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: allProducts
              .map(
                (e) => ListTile(
                  leading: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(e['thumbnail']),
                      ),
                    ),
                  ),
                  title: Text(e['title']),
                  trailing: IconButton(
                    icon: Icon(
                      cartItems.contains(e)
                          ? CupertinoIcons.cart_badge_minus
                          : CupertinoIcons.cart_badge_plus,
                    ),
                    onPressed: () {
                      if (cartItems.contains(e)) {
                        print("Already in cart !!");
                      } else {
                        setState(() {
                          cartItems.add(e);
                        });
                      }
                    },
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
