import 'package:flutter/material.dart';
import 'package:ifixied_membership_app/models/service_item.dart';
import 'package:ifixied_membership_app/theme/app_spacing.dart';
import 'package:ifixied_membership_app/ui/components/app_bar_component.dart';
import 'package:ifixied_membership_app/ui/components/app_text_field.dart';
import 'package:ifixied_membership_app/ui/components/card/service_tracking_card.dart';
import 'package:ifixied_membership_app/ui/components/carousel/button_carrousel.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({super.key});

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  int _selectedIndex = 0;

  final List<ServiceItem> dummyServices = [
    ServiceItem(
      title: 'MacBook Pro A1398',
      invoice: 'SRV28-202507-0175',
      date: '10 Juli 2025',
      issue: 'Logicboard konslet\nJalur power',
      status: ServiceStatus.proses,
    ),
    ServiceItem(
      title: 'iPhone 13 Pro',
      invoice: 'SRV28-202507-0181',
      date: '12 Juli 2025',
      issue: 'LCD bergaris\nTouch tidak berfungsi',
      status: ServiceStatus.proses,
    ),
    ServiceItem(
      title: 'iPad Air 5',
      invoice: 'SRV28-202507-0190',
      date: '15 Juli 2025',
      issue: 'Tidak bisa charging',
      status: ServiceStatus.selesai,
    ),
    ServiceItem(
      title: 'MacBook Air M2',
      invoice: 'SRV28-202507-0203',
      date: '18 Juli 2025',
      issue: 'Keyboard terkena cairan',
      status: ServiceStatus.selesai,
    ),
    ServiceItem(
      title: 'Apple Watch Series 8',
      invoice: 'SRV28-202507-0211',
      date: '20 Juli 2025',
      issue: 'Baterai cepat habis',
      status: ServiceStatus.proses,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(title: "Lacak"),
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
                  "Semua Status",
                  "Semua Tanggal",
                ],
                onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),

              AppSpacing.xl,

              Column(
                children: dummyServices
                    .map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: ServiceTrackingCard(item: item),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}