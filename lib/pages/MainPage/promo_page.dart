import 'package:flutter/material.dart';
import 'package:ifixied_membership_app/ui/components/app_bar_component.dart';
import 'package:ifixied_membership_app/ui/components/app_image_wrapper.dart';

class PromoPage extends StatefulWidget {
  const PromoPage({super.key});

  @override
  State<PromoPage> createState() => _PromoPage();
}

class _PromoPage extends State<PromoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(title: "Spesial Promo"),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(overscroll: false),
        child: SingleChildScrollView(
          physics:  const ClampingScrollPhysics(),
          child: Column(
            children: [
              AppImageWrapper(
                image: 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/c79cf209-36c2-4d8d-b53c-d3fa1b708c55/dfvoq25-bba6f503-64ee-4ea2-9905-b6ca27685d3e.jpg/v1/fill/w_1419,h_563,q_70,strp/kobo_kanaeru___banner_by_estehlychee_dfvoq25-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NjU1IiwicGF0aCI6Ii9mL2M3OWNmMjA5LTM2YzItNGQ4ZC1iNTNjLWQzZmExYjcwOGM1NS9kZnZvcTI1LWJiYTZmNTAzLTY0ZWUtNGVhMi05OTA1LWI2Y2EyNzY4NWQzZS5qcGciLCJ3aWR0aCI6Ijw9MTY1MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.qxvDKQXLlnV2R2W29X6MfYSv9kCysfFgdWmeZcr6EPc',
                isNetwork: true,
                )
            ],
          ),
        ),
      ),
    );
  }
}
