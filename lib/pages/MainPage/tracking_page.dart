import 'package:flutter/material.dart';
import 'package:ifixied_membership_app/ui/components/app_bar_component.dart';

class TrackingPage extends StatefulWidget{
  const TrackingPage({super.key});

  @override
  State<TrackingPage> createState() => _TrackingPage();
}

class _TrackingPage extends State<TrackingPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(title: "Lacak")
    );
  }
}