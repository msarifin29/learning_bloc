import 'package:flutter/material.dart';

import '../models/post.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.blue.shade50,
          child: ListTile(
            leading: SizedBox(
              height: 25,
              width: 25,
              child: Text(
                '$post.id',
                style: textTheme.caption?.copyWith(color: Colors.black),
              ),
            ),
            title: Text(post.title),
            isThreeLine: true,
            subtitle: Text(post.body),
            // dense: true,
          ),
        ),
      ),
    );
  }
}
