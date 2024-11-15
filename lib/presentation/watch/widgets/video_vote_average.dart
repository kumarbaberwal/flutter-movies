// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class VideoVoteAverage extends StatelessWidget {
  final double videoVoteAverage;
  const VideoVoteAverage({
    super.key,
    required this.videoVoteAverage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 20,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          videoVoteAverage.toStringAsFixed(1),
          style: const TextStyle(
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
