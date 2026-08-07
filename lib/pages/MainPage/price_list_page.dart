import 'package:flutter/material.dart';
import 'package:ifixied_membership_app/theme/app_spacing.dart';
import 'package:ifixied_membership_app/ui/components/app_bar_component.dart';
import 'package:ifixied_membership_app/ui/components/carousel/button_carrousel.dart';
import 'package:ifixied_membership_app/ui/components/carousel/image_carrousel.dart';

class PriceListPage extends StatefulWidget {
  const PriceListPage({super.key});

  @override
  State<PriceListPage> createState() => _PriceListPageState();
}

class _PriceListPageState extends State<PriceListPage> {
  int _selectedIndex = 0;

  final List<String> dummyImages = const [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4sFUqGfra06zv6qWiNDwCwdvDTg7eIqVLHhqHBBzao&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAjrfuNYySvbtIysIIY5r5-yHv8_MC5pZsOX0XxLeE3A&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtV1fiKXcnLr9lMhwvUCN4TtxuItvURxRwT-mZ5i6sNA&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxT1LbiuOyxaGIScsxhH9gwjZPzQgnykwO2PC76qxxFg&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqm8yTkxA3lgjYcab1f1m-V8ewyeBXszaMxjnft09jjQ&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6Q7DiefIH4sECAUSCTRICmOp-DnsZsLHeGa6eeY6RaA&s=10",
  ];

  late final List<Map<String, dynamic>> categories = [
    {
      "title": "Iphone",
      "images": dummyImages,
    },
    {
      "title": "MacBook",
      "images": dummyImages,
    },
    {
      "title": "Ipad",
      "images": dummyImages,
    },
    {
      "title": "Apple Watch",
      "images": dummyImages,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(title: "Pricelist"),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          overscroll: false,
        ),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              AppSpacing.xl,

              AppButtonCarousel(
                selectedIndex: _selectedIndex,
                items: const [
                  "Semua",
                  "Iphone",
                  "Macbook",
                  "Ipad",
                  "AppleWatch",
                ],
                onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),

              AppSpacing.xl,

              ...List.generate(categories.length, (i) {
                if (_selectedIndex != 0 && _selectedIndex != i + 1) {
                  return const SizedBox.shrink();
                }

                return Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: ImageCarousel(
                    title: categories[i]["title"] as String,
                    isNetwork: true,
                    images: categories[i]["images"] as List<String>,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}