import 'package:flutter/material.dart';
import 'package:socshea/features/social/feeds/presentation/views/widgets/feed_appbar.dart';
import 'package:socshea/features/social/feeds/presentation/views/widgets/post_widget.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TFeedAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPostWidget()
          ],
        ),
      ),
    );
  }
}
