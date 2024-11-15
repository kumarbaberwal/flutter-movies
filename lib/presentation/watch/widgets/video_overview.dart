// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class VideoOverview extends StatelessWidget {
  final String overview;
  const VideoOverview({
    super.key,
    required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Overview",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          overview.toString(),
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
