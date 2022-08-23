import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TestPage extends HookConsumerWidget {
  const TestPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            TextButton(
              onPressed: () async {},
              child: const Text("Text button"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("ElevatedButton"),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text("OutlinedButton"),
            ),
          ],
        ),
      ),
    );
  }
}
