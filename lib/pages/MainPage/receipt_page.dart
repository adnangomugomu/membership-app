import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ifixied_membership_app/models/service_item.dart';
import 'package:ifixied_membership_app/theme/app_spacing.dart';
import 'package:ifixied_membership_app/ui/components/app_bar_component.dart';
import 'package:ifixied_membership_app/ui/components/app_text_field.dart';
import 'package:ifixied_membership_app/ui/components/card/service_receipt_card.dart';
import 'package:ifixied_membership_app/ui/components/carousel/button_carrousel.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({super.key});

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  int _selectedIndex = 0;

  late final List<Map<String, dynamic>> receipts = [
    {
      "category": "Iphone",
      "item": ServiceItem(
        title: "iPhone 13 Pro",
        invoice: "SRV28-202507-0001",
        date: "10 Juli 2025",
        issue: "Ganti LCD",
        status: ServiceStatus.selesai,
      ),
    },
    {
      "category": "Macbook",
      "item": ServiceItem(
        title: "Macbook Pro A1398",
        invoice: "SRV28-202507-0175",
        date: "10 Juli 2025",
        issue: "Logicboard konslet Jalur power",
        status: ServiceStatus.selesai,
      ),
    },
    {
      "category": "Ipad",
      "item": ServiceItem(
        title: "iPad Air 5",
        invoice: "SRV28-202507-0210",
        date: "11 Juli 2025",
        issue: "Touchscreen error",
        status: ServiceStatus.selesai,
      ),
    },
    {
      "category": "AppleWatch",
      "item": ServiceItem(
        title: "Apple Watch Series 9",
        invoice: "SRV28-202507-0320",
        date: "12 Juli 2025",
        issue: "Ganti baterai",
        status: ServiceStatus.selesai,
      ),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(title: "Nota"),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          overscroll: false,
        ),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              AppSpacing.xl,

              AppTextField(
                label: "Search",
                hintText: "Masukkan nomor invoice",
                isSearchField: true,
              ),

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

              ...List.generate(receipts.length, (i) {
                if (_selectedIndex != 0 && _selectedIndex != i + 1) {
                  return const SizedBox.shrink();
                }

                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: ServiceReceiptCard(
                    item: receipts[i]["item"] as ServiceItem,
                    onTapDetail: (){context.go('/receipt/detais');},
                  ),
                );
              }),

              AppSpacing.xl,
            ],
          ),
        ),
      ),
    );
  }
}