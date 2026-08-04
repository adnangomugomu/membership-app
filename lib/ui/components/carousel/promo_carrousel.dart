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
    this.isAsset = true,
    this.autoScroll = true,
    this.autoScrollDuration =
        const Duration(seconds: 5),
  });

  @override
  State<PromoCarousel> createState() =>
      _PromoCarouselState();
}

class _PromoCarouselState
    extends State<PromoCarousel> {
  late PageController _pageController;

  int _currentIndex = 0;

  Timer? _timer;

  // ==============================
  // Dummy Promo Banner
  // ==============================

  final List<String> dummyPromoBanners = const [
    'assets/image/promo_banner_1.png',
    'assets/image/promo_banner_2.png',
    'assets/image/promo_banner_3.png',
  ];

  // ==============================
  // Gunakan data dari luar jika ada
  // Jika tidak ada, gunakan dummy
  // ==============================

  List<String> get banners {
    return widget.imageList ??
        dummyPromoBanners;
  }

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      viewportFraction: 0.91,
      initialPage: 0,
    );

    if (widget.autoScroll &&
        banners.length > 1) {
      _startAutoScroll();
    }
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(
      widget.autoScrollDuration,
      (timer) {
        if (_pageController.hasClients) {
          int nextPage =
              _currentIndex + 1;

          if (nextPage >=
              banners.length) {
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
        // ==============================
        // Promo Carousel
        // ==============================

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

            itemBuilder:
                (context, index) {
              return GestureDetector(
                onTap: () {
                  widget.onTap
                      ?.call(index);
                },

                child: Container(
                  margin:
                      const EdgeInsets
                          .symmetric(
                    horizontal: 6.0,
                  ),

                  decoration:
                      BoxDecoration(
                    borderRadius:
                        BorderRadius
                            .circular(
                      24.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(
                          0.12,
                        ),
                        blurRadius: 12,
                        offset:
                            const Offset(
                          0,
                          6,
                        ),
                      ),
                    ],
                  ),

                  child: ClipRRect(
                    borderRadius:
                        BorderRadius
                            .circular(
                      24.0,
                    ),

                    // ==============================
                    // Local Asset / Network Image
                    // ==============================

                    child: widget.isAsset
                        ? Image.asset(
                            banners[index],
                            fit: BoxFit.contain,

                            errorBuilder:
                                (
                              context,
                              error,
                              stackTrace,
                            ) {
                              return _errorImage();
                            },
                          )
                        : Image.network(
                            banners[index],
                            fit: BoxFit.contain,

                            errorBuilder:
                                (
                              context,
                              error,
                              stackTrace,
                            ) {
                              return _errorImage();
                            },
                          ),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 14),

        // ==============================
        // Indicator Dots
        // ==============================

        Row(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: List.generate(
            banners.length,
            (index) =>
                AnimatedContainer(
              duration:
                  const Duration(
                milliseconds: 300,
              ),
              margin:
                  const EdgeInsets
                      .symmetric(
                horizontal: 4.0,
              ),
              width:
                  _currentIndex == index
                      ? 24.0
                      : 8.0,
              height: 8.0,
              decoration:
                  BoxDecoration(
                color:
                    _currentIndex ==
                            index
                        ? Colors.black
                        : Colors.grey[300],
                borderRadius:
                    BorderRadius
                        .circular(
                  4.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ==============================
  // Error Image
  // ==============================

  Widget _errorImage() {
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
  }
}