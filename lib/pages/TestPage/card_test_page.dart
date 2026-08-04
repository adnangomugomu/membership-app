import 'package:flutter/material.dart';
import 'package:ifixied_membership_app/ui/components/carousel/flash_sale_carousel.dart';

class CardTestPage extends StatefulWidget {
  const CardTestPage({super.key});

  @override
  State<CardTestPage> createState() => _CardTestPageState();
}

class _CardTestPageState extends State<CardTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlashSaleCarousel(),
      ),
    );
  }
}