import 'package:bizkit/module/biz_card/application/presentation/screens2/preview_commen_widgets/brochers_and_products_builder/brocher_and_products_tab/brocherss_builder.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/preview_commen_widgets/brochers_and_products_builder/brocher_and_products_tab/products_builder.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/brochure.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/product.dart';
import 'package:flutter/material.dart';

class CardBrochursAndProductsTab extends StatelessWidget {
  const CardBrochursAndProductsTab(
      {super.key, required this.networkImages, required this.pdf});

  final List<Product> networkImages;
  final List<Brochure> pdf;

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
        body: TabBarView(
          children: [
            BrochureBuilder(pdf: pdf),
            ProductsBuilder(products: networkImages),
          ],
        ),
      ),
    );
  }
}
