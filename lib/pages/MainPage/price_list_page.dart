import 'package:flutter/material.dart';
import 'package:ifixied_membership_app/theme/app_spacing.dart';
import 'package:ifixied_membership_app/ui/components/app_bar_component.dart';
import 'package:ifixied_membership_app/ui/components/carousel/button_carrousel.dart';

class PriceListPage extends StatefulWidget {
  const PriceListPage({super.key});

  @override
  State<PriceListPage> createState() => _PriceListPage();
}

class _PriceListPage extends State<PriceListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(title: "Pricelist"),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(overscroll: false),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              AppSpacing.xl,
              AppButtonCarousel(
                items: const ["Semua", "Iphone", "Mackbook", "Ipad","AppleWatch"],
                onTap: (index) {
                  debugPrint("Selected: $index");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
