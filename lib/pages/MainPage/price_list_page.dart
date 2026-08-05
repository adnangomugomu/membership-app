import 'package:flutter/material.dart';
import 'package:ifixied_membership_app/ui/components/app_bar_component.dart';

class PriceListPage extends StatefulWidget{
  const PriceListPage({super.key});

  @override
  State<PriceListPage> createState() => _PriceListPage();
}

class _PriceListPage extends State<PriceListPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(title: "Pricelist")
    );
  }
}