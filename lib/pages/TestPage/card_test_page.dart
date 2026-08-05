import 'package:flutter/material.dart';
// Tambahkan alias 'as receipt' dan 'as tracking'
import 'package:ifixied_membership_app/models/service_receipt_item.dart' as receipt;
import 'package:ifixied_membership_app/models/service_item.dart' as tracking;

import 'package:ifixied_membership_app/ui/components/card/service_receipt_card.dart';
import 'package:ifixied_membership_app/ui/components/carousel/flash_sale_carousel.dart';
import 'package:ifixied_membership_app/ui/components/carousel/coupon_carrousel.dart';
import 'package:ifixied_membership_app/ui/components/carousel/promo_carrousel.dart';
import 'package:ifixied_membership_app/ui/components/carousel/store_location_carrousel.dart';
import 'package:ifixied_membership_app/ui/components/card/service_tracking_card.dart';

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

              ServiceReceiptCard(
                item: receipt.ServiceReceiptItem(
                  date: '10 Juli 2025',
                  title: 'Macbook Pro A1398',
                  description: 'Logicboard konslet jalur power',
                  price: 'Rp1.750.000',
                  status: receipt.ServiceStatus.proses, // Panggil lewat prefix
                ),
              ),

              const SizedBox(height: 16),

              CouponCarrousel(),

              const SizedBox(height: 16),

              PromoCarousel(),

              const SizedBox(height: 16),

              StoreCarousel(),

              const SizedBox(height: 16),

              ServiceTrackingCard(
                item: tracking.ServiceItem(
                  title: 'Macbook Pro A1398',
                  invoice: 'SRV28-202507-0175',
                  date: '10 Juli 2025',
                  issue: 'Logicboard konslet\njalur power',
                  status: tracking.ServiceStatus.proses, // Panggil lewat prefix
                ),
                onTapAction: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}