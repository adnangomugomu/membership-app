import 'package:flutter/material.dart';

class AppProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String currentPrice;
  final String originalPrice;
  final double stockProgress; // Nilai antara 0.0 sampai 1.0 (misal: 0.4)
  final String stockStatus;
  final VoidCallback? onTap;

  const AppProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.currentPrice,
    required this.originalPrice,
    required this.stockProgress,
    required this.stockStatus,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 170, // Sesuaikan lebar card jika perlu
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.0), // Rounded border yang halus
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // 1. Gambar Produk
            Center(
              child: SizedBox(
                height: 110,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.image_not_supported_outlined,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 2. Judul Produk
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 6),

            // 3. Harga Produk (Diskon & Original)
            Row(
              children: [
                Text(
                  currentPrice,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    originalPrice,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // 4. Custom Progress Bar Stok
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: LinearProgressIndicator(
                value: stockProgress.clamp(0.0, 1.0),
                minHeight: 6,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
              ),
            ),
            const SizedBox(height: 8),

            // 5. Teks Stok / Status
            Text(
              stockStatus,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}