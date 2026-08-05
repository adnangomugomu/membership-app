import 'package:flutter/material.dart';

enum ServiceStatus {
  proses,
  selesai,
  dibatalkan,
}

class ServiceReceiptItem {
  final String date;
  final String title;
  final String description;
  final String price;
  final ServiceStatus status;

  ServiceReceiptItem({
    required this.date,
    required this.title,
    required this.description,
    required this.price,
    required this.status,
  });

  Color get statusBgColor {
    switch (status) {
      case ServiceStatus.proses:
        return const Color(0xFFFFF0E6);
      case ServiceStatus.selesai:
        return const Color(0xFFE8F8EE);
      case ServiceStatus.dibatalkan:
        return const Color(0xFFFFEBEB);
    }
  }

  Color get statusTextColor {
    switch (status) {
      case ServiceStatus.proses:
        return const Color(0xFFFF6B2C);
      case ServiceStatus.selesai:
        return const Color(0xFF43C669);
      case ServiceStatus.dibatalkan:
        return const Color(0xFFFF5252);
    }
  }

  String get statusText {
    switch (status) {
      case ServiceStatus.proses:
        return 'Proses Service';
      case ServiceStatus.selesai:
        return 'Service Selesai';
      case ServiceStatus.dibatalkan:
        return 'Service Dibatalkan';
    }
  }
}