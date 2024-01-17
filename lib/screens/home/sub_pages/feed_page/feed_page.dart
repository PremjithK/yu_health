import 'package:flutter/material.dart';
import 'package:yu_health/core/config/layout.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Blog'),
      ),
      body: SingleChildScrollView(
        padding: PageLayout.pagePadding,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
