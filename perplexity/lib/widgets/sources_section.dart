import 'package:flutter/material.dart';
import 'package:perplexity_clone/services/chat_web_services.dart';
import 'package:perplexity_clone/themes/colors.dart';

class SourcesSection extends StatefulWidget {
  const SourcesSection({super.key});

  @override
  State<SourcesSection> createState() => _SourcesSectionState();
}

class _SourcesSectionState extends State<SourcesSection> {
  List searchResults = [];
  @override
  void initState() {
    super.initState();
    ChatWebService().searchResultStream.listen((data) {
      setState(() {
        searchResults = data['data'];
      });
    });
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.source_outlined, color: Colors.white70),
            SizedBox(width: 8),
            Text(
              "Sources",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 20),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: searchResults.map((res) {
            return Container(
              width: 150,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    res['title'],
                    style: TextStyle(fontWeight: FontWeight.w500),
                    maxLines: 2,
                  ),
                  SizedBox(height: 8),
                  Text(
                    res['url'],
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
