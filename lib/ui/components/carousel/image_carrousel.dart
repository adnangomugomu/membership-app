import 'package:flutter/material.dart';
import 'package:ifixied_membership_app/ui/components/app_image_wrapper.dart';

class ImageCarousel extends StatefulWidget {
  final String title;
  final List<String> images;
  final double width;
  final double height;
  final double borderRadius;
  final bool isNetwork;
  final VoidCallback? onTap;
  final double horizontalPadding;

  const ImageCarousel({
    super.key,
    required this.title,
    required this.images,
    this.width = 120,
    this.height = 160,
    this.borderRadius = 12,
    this.isNetwork = false,
    this.onTap,
    this.horizontalPadding = 20,
  });

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: widget.horizontalPadding,
          ),
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: widget.horizontalPadding),
          child: Row(
            children: List.generate(
              widget.images.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 12),
                child: GestureDetector(
                  onTap: widget.onTap,
                  child: AppImageWrapper(
                    image: widget.images[index],
                    width: widget.width,
                    height: widget.height,
                    borderRadius: widget.borderRadius,
                    isNetwork: widget.isNetwork,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}