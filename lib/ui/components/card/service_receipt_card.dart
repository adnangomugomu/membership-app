import 'package:flutter/material.dart';
import '../../../models/service_receipt_item.dart';

class ServiceReceiptCard extends StatelessWidget {
  final ServiceReceiptItem item;
  final VoidCallback? onTapDetail;

  const ServiceReceiptCard({
    super.key,
    required this.item,
    this.onTapDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row 1: Tanggal & Badge Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.date,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF757575),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: item.statusBgColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  item.statusText,
                  style: TextStyle(
                    color: item.statusTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Judul Perangkat
          Text(
            item.title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF141414),
            ),
          ),
          const SizedBox(height: 4),

          // Deskripsi Kerusakan
          Text(
            item.description,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF424242),
            ),
          ),
          const SizedBox(height: 14),

          // Garis Putus-putus (Dashed Divider)
          Row(
            children: List.generate(
              35,
              (index) => Expanded(
                child: Container(
                  height: 1,
                  color: index % 2 == 0 ? Colors.transparent : Colors.grey[300],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Row Bottom: Total Harga & Tombol Detail
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Harga',
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xFF757575),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.price,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF141414),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: onTapDetail,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF141414),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
                ),
                child: const Text(
                  'Detail',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}