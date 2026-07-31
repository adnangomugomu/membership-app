import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarComponent({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(icon: const Icon(Icons.arrow_back),onPressed: () {
        Navigator.pop(context);
      },),
      title: Text(title),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/Header.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}