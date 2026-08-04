import 'package:flutter/material.dart';
import 'package:ifixied_membership_app/ui/components/carousel/flash_sale_carousel.dart';
import 'package:ifixied_membership_app/ui/components/carousel/coupon_carrousel.dart';
import 'package:ifixied_membership_app/ui/components/carousel/promo_carrousel.dart';
import 'package:ifixied_membership_app/ui/components/carousel/store_location_carrousel.dart';

class CardTestPage extends StatefulWidget {
  const CardTestPage({super.key});

  @override
  State<CardTestPage> createState() => _CardTestPageState();
} 

class _CardTestPageState extends State<CardTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FlashSaleCarousel(),

              const SizedBox(height: 16),

              CouponCarrousel(),

              const SizedBox(height: 16),

              PromoCarousel(),

              const SizedBox(height: 16),

              StoreCarousel(),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}