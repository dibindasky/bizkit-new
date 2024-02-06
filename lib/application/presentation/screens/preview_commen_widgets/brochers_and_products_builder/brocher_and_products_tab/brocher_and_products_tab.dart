import 'package:bizkit/application/presentation/screens/preview_commen_widgets/brochers_and_products_builder/brocher_and_products_tab/brocherss_builder.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/brochers_and_products_builder/brocher_and_products_tab/products_builder.dart';
import 'package:flutter/material.dart';

class BrochersAndProductsTab extends StatelessWidget {
  const BrochersAndProductsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 18,
            ),
          ),
          toolbarHeight: 30,
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Center(
                  child: Text('Brochure'),
                ),
              ),
              Tab(
                child: Center(
                  child: Text('Products'),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            BrochersBuilder(),
            ProductsBuilder(),
          ],
        ),
      ),
    );
  }
}
