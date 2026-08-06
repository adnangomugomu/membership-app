import 'package:flutter/material.dart';
import 'package:ifixied_membership_app/ui/components/app_bar_component.dart';
import 'package:flutter/material.dart';
import 'package:ifixied_membership_app/models/service_item.dart';
import 'package:ifixied_membership_app/theme/app_spacing.dart';
import 'package:ifixied_membership_app/ui/components/app_bar_component.dart';
import 'package:ifixied_membership_app/ui/components/app_text_field.dart';
import 'package:ifixied_membership_app/ui/components/card/service_receipt_card.dart';



class ReceiptPage extends StatefulWidget{
  const ReceiptPage({super.key});

  @override
  State<ReceiptPage> createState() => _ReceiptPage();
}

class _ReceiptPage extends State<ReceiptPage>{

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(title: "Nota"),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(overscroll: false),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              AppSpacing.xl,
              AppTextField(label: "Search",hintText: "Masukkan nomor invoice"),
              AppSpacing.xl,
              ServiceReceiptCard(
                item: ServiceItem(
                  title: 'Macbook Pro A1398',
                  invoice: 'SRV28-202507-0175',
                  date: '10 Juli 2025',
                  issue: 'Logicboard konslet\njalur power',
                  status: ServiceStatus.selesai, 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}