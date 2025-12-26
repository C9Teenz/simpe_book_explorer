import 'package:flutter/material.dart';

class CustomImageNetwork extends StatefulWidget {
  final int? coverId;
  final double? width;
  final double? height;
  final String? sizeImage;

  const CustomImageNetwork(
      {super.key, this.coverId, this.width, this.height, this.sizeImage});

  @override
  State<CustomImageNetwork> createState() => _CustomImageNetworkState();
}

class _CustomImageNetworkState extends State<CustomImageNetwork> {
  bool _imageLoaded = false;

  @override
  Widget build(BuildContext context) {
    if (widget.coverId == null) {
      return _buildPlaceholder();
    }

    return Stack(
      children: [
        if (!_imageLoaded) _buildLoadingPlaceholder(),
        Image.network(
          'https://covers.openlibrary.org/b/id/${widget.coverId}-${widget.sizeImage?.toUpperCase() ?? 'M'}.jpg',
          fit: BoxFit.cover,
          width: widget.width,
          height: widget.height,
          errorBuilder: (context, error, stackTrace) {
            return _buildPlaceholder();
          },
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) {
              _imageLoaded = true;
              return child;
            }
            if (frame != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  setState(() {
                    _imageLoaded = true;
                  });
                }
              });
              return child;
            }
            return _buildLoadingPlaceholder();
          },
        ),
      ],
    );
  }

  Widget _buildLoadingPlaceholder() {
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.grey[200],
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.grey[600],
          strokeWidth: 2,
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.book, color: Colors.grey[600]),
          Text("No Cover", style: TextStyle(color: Colors.grey[600])),
        ],
      ),
    );
  }
}
