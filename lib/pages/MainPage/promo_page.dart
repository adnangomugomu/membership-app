import 'package:flutter/material.dart';
import 'package:ifixied_membership_app/ui/components/app_bar_component.dart';

class PromoPage extends StatefulWidget{
  const PromoPage({super.key});

  @override
  State<PromoPage> createState() => _PromoPage();
}

class _PromoPage extends State<PromoPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(title: "Spesial Promo")
    );
  }
}