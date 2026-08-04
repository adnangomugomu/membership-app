import 'dart:async';

import 'package:flutter/material.dart';

class CouponCarrousel extends StatefulWidget {
  final List<String>? imageList;
  final Function(int index)? onTap;
  final double height;
  final bool isAsset;
  final bool autoScroll;

  const CouponCarrousel({
    super.key,
    this.imageList,
    this.onTap,
    this.height = 180.0,
    this.isAsset = false,
    this.autoScroll = true,
  });

  @override
  State<CouponCarrousel> createState() => _CouponCarrouselState();
}

class _CouponCarrouselState extends State<CouponCarrousel> {
  late PageController _pageController;

  int _currentIndex = 0;

  Timer? _timer;

  // Dummy data sementara.
  // Nanti bisa diganti dengan data dari API.
  final List<String> dummyPromoBanners = const [
    'https://images.unsplash.com/photo-1607083206968-13611e3d76db',
    'https://images.unsplash.com/photo-1607082349566-187342175e2f',
    'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d',
  ];

  // Data yang digunakan carousel.
  // Kalau imageList dari luar tersedia, gunakan imageList.
  // Kalau tidak ada, gunakan dummy data.
  List<String> get banners {
    return widget.imageList ?? dummyPromoBanners;
  }

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      viewportFraction: 0.88,
      initialPage: 0,
    );

    if (widget.autoScroll && banners.length > 1) {
      _startAutoScroll();
    }
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(
      const Duration(seconds: 5),
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
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
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
                                color: Colors.grey[300],
                                child: const Icon(
                                  Icons.broken_image,
                                  color: Colors.grey,
                                  size: 40,
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

        const SizedBox(height: 12),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            banners.length,
            (index) => AnimatedContainer(
              duration: const Duration(
                milliseconds: 300,
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 3.0,
              ),
              width: _currentIndex == index
                  ? 20.0
                  : 6.0,
              height: 6.0,
              decoration: BoxDecoration(
                color: _currentIndex == index
                    ? Colors.grey
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}