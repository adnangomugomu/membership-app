import 'dart:async';

import 'package:flutter/material.dart';

class PromoCarousel extends StatefulWidget {
  final List<String>? imageList;
  final Function(int index)? onTap;
  final double height;
  final bool isAsset;
  final bool autoScroll;
  final Duration autoScrollDuration;

  const PromoCarousel({
    super.key,
    this.imageList,
    this.onTap,
    this.height = 240.0,
    this.isAsset = false,
    this.autoScroll = true,
    this.autoScrollDuration = const Duration(seconds: 5),
  });

  @override
  State<PromoCarousel> createState() => _PromoCarouselState();
}

class _PromoCarouselState extends State<PromoCarousel> {
  late PageController _pageController;

  int _currentIndex = 0;

  Timer? _timer;

  // Dummy banner sementara.
  // Nanti bisa diganti dengan data dari API.
  final List<String> dummyPromoBanners = const [
    'https://images.unsplash.com/photo-1607083206968-13611e3d76db',
    'https://images.unsplash.com/photo-1607082349566-187342175e2f',
    'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d',
  ];

  // Gunakan imageList dari luar jika tersedia.
  // Jika tidak ada, gunakan dummy data.
  List<String> get banners {
    return widget.imageList ?? dummyPromoBanners;
  }

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      viewportFraction: 0.91,
      initialPage: 0,
    );

    if (widget.autoScroll && banners.length > 1) {
      _startAutoScroll();
    }
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(
      widget.autoScrollDuration,
      (timer) {
        if (_pageController.hasClients) {
          int nextPage = _currentIndex + 1;

          if (nextPage >= banners.length) {
            nextPage = 0;
          }

          _pageController.animateToPage(
            nextPage,
            duration: const Duration(
              milliseconds: 600,
            ),
            curve: Curves.easeInOut,
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (banners.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Promo Carousel
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            controller: _pageController,
            itemCount: banners.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  widget.onTap?.call(index);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 6.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      24.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      24.0,
                    ),
                    child: widget.isAsset
                        ? Image.asset(
                            banners[index],
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            banners[index],
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[900],
                                child: const Center(
                                  child: Icon(
                                    Icons.broken_image,
                                    color: Colors.grey,
                                    size: 48,
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 14),

        // Indicator Dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            banners.length,
            (index) => AnimatedContainer(
              duration: const Duration(
                milliseconds: 300,
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 4.0,
              ),
              width: _currentIndex == index
                  ? 24.0
                  : 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                color: _currentIndex == index
                    ? Colors.black
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  4.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}