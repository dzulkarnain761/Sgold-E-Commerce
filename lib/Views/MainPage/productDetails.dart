import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgold/utils/constants/colors.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:sgold/utils/helpers/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetails extends StatefulWidget {
  final String image;
  final String title;
  final String weight;

  ProductDetails({
    Key? key,
    required this.image,
    required this.title,
    required this.weight,
  }) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final ImageProvider = CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: widget.image,
      placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(color: TColors.secondary)),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.transparent,
            width: Get.width,
            height: Get.height * 0.4,
            child: Stack(
              children: [
                Center(
                  child: InteractiveViewer(
                    minScale: 0.1,
                    maxScale: 3,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: widget.image,
                      placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(
                              color: TColors.secondary)),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black87),
                      child: const Icon(Icons.arrow_back_rounded,
                          size: 30, color: Colors.white),
                    ),
                    onTap: () => Get.back(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.title,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${widget.weight} g',
              style: const TextStyle(color: Colors.green, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
