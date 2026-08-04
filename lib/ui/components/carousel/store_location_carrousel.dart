import 'package:flutter/material.dart';

class LocationItem {
  final String title;
  final String imageUrl;
  final VoidCallback? onTap;

  LocationItem({
    required this.title,
    required this.imageUrl,
    this.onTap,
  });
}

class StoreCarousel extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<LocationItem>? locations;
  final VoidCallback? onHeaderTap;
  final bool isAsset;

  const StoreCarousel({
    super.key,
    this.title = 'Lagi cari tempat service?',
    this.subtitle = 'Cek tempat service terdekat',
    this.locations,
    this.onHeaderTap,
    this.isAsset = false,
  });

  // Dummy data sementara.
  // Nanti bisa diganti dengan data dari API.
  List<LocationItem> get dummyLocations {
    return [
      LocationItem(
        title: 'Jakarta',
        imageUrl:
            'https://images.unsplash.com/photo-1555899434-94d1368aa7af',
        onTap: () {
          debugPrint('Jakarta diklik');
        },
      ),
      LocationItem(
        title: 'Yogyakarta',
        imageUrl:
            'https://images.unsplash.com/photo-1596422846543-75c6fc197f07',
        onTap: () {
          debugPrint('Yogyakarta diklik');
        },
      ),
      LocationItem(
        title: 'Bandung',
        imageUrl:
            'https://images.unsplash.com/photo-1518002054494-3a6f94352e9d',
        onTap: () {
          debugPrint('Bandung diklik');
        },
      ),
      LocationItem(
        title: 'Surabaya',
        imageUrl:
            'https://images.unsplash.com/photo-1564507592333-c60657eea523',
        onTap: () {
          debugPrint('Surabaya diklik');
        },
      ),
      LocationItem(
        title: 'Semarang',
        imageUrl:
            'https://images.unsplash.com/photo-1584810359583-96fc3448beaa',
        onTap: () {
          debugPrint('Semarang diklik');
        },
      ),
    ];
  }

  // Gunakan data dari API jika locations diberikan.
  // Jika tidak, gunakan dummy data.
  List<LocationItem> get stores {
    return locations ?? dummyLocations;
  }

  @override
  Widget build(BuildContext context) {
    if (stores.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Section
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onHeaderTap,
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Store Carousel
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            itemCount: stores.length,
            itemBuilder: (context, index) {
              final store = stores[index];

              return Container(
                width: 150,
                margin: const EdgeInsets.only(
                  right: 12.0,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    24.0,
                  ),
                  child: Stack(
                    children: [
                      // Background Image
                      Positioned.fill(
                        child: isAsset
                            ? Image.asset(
                                store.imageUrl,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                store.imageUrl,
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[300],
                                    child: const Icon(
                                      Icons.broken_image,
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                              ),
                      ),

                      // Gradient Overlay
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.1),
                                Colors.black.withOpacity(0.85),
                              ],
                              stops: const [
                                0.5,
                                0.7,
                                1.0,
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Text Overlay
                      Positioned(
                        left: 12,
                        right: 12,
                        bottom: 16,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              store.title,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Cek di sini',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[300],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Click Effect
                      Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: store.onTap,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}