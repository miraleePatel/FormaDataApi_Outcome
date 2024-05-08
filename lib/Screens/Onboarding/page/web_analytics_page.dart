import 'package:flutter/material.dart';
import 'package:flutter_sliding_tutorial/flutter_sliding_tutorial.dart';

class WebAnalyticsPage extends StatelessWidget {
  const WebAnalyticsPage(
    this.page,
    this.notifier, {
    super.key,
  });

  final int page;
  final ValueNotifier<double> notifier;

  @override
  Widget build(BuildContext context) {
    return SlidingPage(
      page: page,
      notifier: notifier,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
         /* Center(
            child: FractionallySizedBox(
              widthFactor: 0.5,
              heightFactor: 0.35,
              child: SlidingContainer(
                  offset: 300,
                  child: *//*Image.asset(
                    'assets/s_0_1.png',
                  )*//*),
            ),
          ),*/

        ],
      ),
    );
  }
}
