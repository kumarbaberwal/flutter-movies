// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class VideoReleaseDate extends StatelessWidget {
  final DateTime videoReleaseDate;
  const VideoReleaseDate({
    super.key,
    required this.videoReleaseDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.calendar_month,
          color: Colors.grey,
          size: 20,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          videoReleaseDate.toString().split(' ')[0],
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
