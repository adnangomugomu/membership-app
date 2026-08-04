import 'package:flutter/material.dart';
import 'package:ifixied_membership_app/theme/app_spacing.dart';
import 'package:ifixied_membership_app/ui/components/bar/app_bar_user.dart';
import 'package:ifixied_membership_app/ui/components/carousel/coupon_carrousel.dart';
import 'package:ifixied_membership_app/ui/components/carousel/flash_sale_carousel.dart';
import 'package:ifixied_membership_app/ui/components/carousel/promo_carrousel.dart';
import 'package:ifixied_membership_app/ui/components/carousel/store_location_carrousel.dart';
import 'package:ifixied_membership_app/ui/components/app_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Membuat body berada di belakang bottom navbar
      extendBody: true,

      backgroundColor: Colors.white,

      appBar: const AppBarUser(),

      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          overscroll: false,
        ),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              // Supaya konten tidak ketutup AppBar
              const SizedBox(height: 16),

              PromoCarousel(),

              AppSpacing.lg,

              FlashSaleCarousel(),

              AppSpacing.lg,

              CouponCarrousel(),

              AppSpacing.lg,

              StoreCarousel(),

              // Tambahkan space supaya konten terakhir
              // tidak tertutup navbar
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),

      bottomNavigationBar: const AppNavigationBar(
        currentIndex: 0,
      ),
    );
  }
}