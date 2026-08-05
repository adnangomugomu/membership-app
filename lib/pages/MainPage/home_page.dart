import 'package:flutter/material.dart';
import 'package:ifixied_membership_app/theme/app_spacing.dart';
import 'package:ifixied_membership_app/ui/components/bar/app_bar_user.dart';
import 'package:ifixied_membership_app/ui/components/carousel/coupon_carrousel.dart';
import 'package:ifixied_membership_app/ui/components/carousel/flash_sale_carousel.dart';
import 'package:ifixied_membership_app/ui/components/carousel/promo_carrousel.dart';
import 'package:ifixied_membership_app/ui/components/carousel/store_location_carrousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const SizedBox(height: 16),

              const PromoCarousel(),

              AppSpacing.lg,

              const FlashSaleCarousel(),

              AppSpacing.lg,

              const CouponCarrousel(),

              AppSpacing.lg,

              const StoreCarousel(),

              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}