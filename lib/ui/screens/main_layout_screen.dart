import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/persistent_header_simple.dart';
import '../widgets/persistent_footer_simple.dart';

class MainLayoutScreen extends ConsumerWidget {
  final Widget child;

  const MainLayoutScreen({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          // Persistent header
          const PersistentHeader(),
          // Main content
          Expanded(child: child),
          // Persistent footer
          const PersistentFooter(),
        ],
      ),
    );
  }
}
