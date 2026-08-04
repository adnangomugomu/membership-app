import 'package:flutter/material.dart';
import 'package:ifixied_membership_app/ui/components/app_text_wrapper.dart';
import 'package:ifixied_membership_app/ui/components/card/app_product_cart.dart';

class FlashSaleCarousel extends StatefulWidget {
  const FlashSaleCarousel({super.key});

  @override
  State<FlashSaleCarousel> createState() =>
      _FlashSaleCarouselState();
}

class _FlashSaleCarouselState
    extends State<FlashSaleCarousel> {
  final List<Map<String, dynamic>> dummyProducts = const [
    {
      'imageUrl':
          'https://kyoucdn.id/items/496065-pvc-figure-kobo-kanaeru-holobabies-ver-hololive-if-13cm.jpg',
      'title': 'Kobo Kanaeru',
      'currentPrice': 'Rp199.000',
      'originalPrice': 'Rp249.000',
      'stockProgress': 0.4,
      'stockStatus': 'Stock Tersedia',
    },
    {
      'imageUrl':
          'https://hololive.hololivepro.com/wp-content/uploads/2020/07/Vestia-Zeta_pr-img_04.webp',
      'title': 'Vestia Zeta',
      'currentPrice': 'Rp299.000',
      'originalPrice': 'Rp349.000',
      'stockProgress': 0.7,
      'stockStatus': 'Stock Tersedia',
    },
    {
      'imageUrl':
          'https://hololive.hololivepro.com/wp-content/uploads/2021/07/Koseki-Bijou_pr-img_01.webp',
      'title': 'Kouseki Bijou',
      'currentPrice': 'Rp399.000',
      'originalPrice': 'Rp449.000',
      'stockProgress': 0.2,
      'stockStatus': 'Stock Terbatas',
    },
    {
      'imageUrl':
          'https://hololive.hololivepro.com/wp-content/uploads/2021/07/Fuwawa-Abyssgard_pr-img_01.webp',
      'title': 'Fuwawa Abyssgard',
      'currentPrice': 'Rp399.000',
      'originalPrice': 'Rp449.000',
      'stockProgress': 0.2,
      'stockStatus': 'Stock Terbatas',
    },
    {
      'imageUrl':
          'https://hololive.hololivepro.com/wp-content/uploads/2021/07/Mococo-Abyssgard_pr-img_01.webp',
      'title': 'Mococo Abyssgard',
      'currentPrice': 'Rp399.000',
      'originalPrice': 'Rp449.000',
      'stockProgress': 0.2,
      'stockStatus': 'Stock Terbatas',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      // Jarak container dari pinggir layar
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage(
            'assets/image/Header.png',
          ),
          fit: BoxFit.cover,
        ),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header Flash Sale
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: const AssetImage(
                  'assets/image/flash_sale_icon.png',
                ),
                width: 60,
                fit: BoxFit.contain,
              ),

              const SizedBox(width: 8),

              AppTextWrapper.heading(
                'Flash Sale Now!',
                color: Colors.white,
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Product Carousel
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: dummyProducts.map((product) {
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 16,
                  ),
                  child: AppProductCard(
                    imageUrl:
                        product['imageUrl'],
                    title:
                        product['title'],
                    currentPrice:
                        product['currentPrice'],
                    originalPrice:
                        product['originalPrice'],
                    stockProgress:
                        product['stockProgress'],
                    stockStatus:
                        product['stockStatus'],
                    onTap: () {
                      debugPrint(
                        '${product['title']} diklik',
                      );
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}