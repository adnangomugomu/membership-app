import 'package:flutter/material.dart';

class AppImageWrapper extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;
  final double borderRadius;
  final BoxFit fit;
  final bool isNetwork;

  const AppImageWrapper({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.borderRadius = 0,
    this.fit = BoxFit.cover,
    this.isNetwork = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: isNetwork
          ? Image.network(
              image,
              width: width,
              height: height,
              fit: fit,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;

                return SizedBox(
                  width: width,
                  height: height,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return SizedBox(
                  width: width,
                  height: height,
                  child: const Center(
                    child: Icon(Icons.broken_image),
                  ),
                );
              },
            )
          : Image.asset(
              image,
              width: width,
              height: height,
              fit: fit,
            ),
    );
  }
}