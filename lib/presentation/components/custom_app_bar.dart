import 'package:flutter/material.dart';

Widget CustomAppBar() {
  return Row(
    children: [
      Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.blue, width: 2),
        ),
        child: const CircleAvatar(
          radius: 24,
          backgroundColor: Colors.transparent,
          child: Icon(Icons.person, size: 28, color: Colors.blue),
        ),
      ),
      const SizedBox(width: 12),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Good Morning", style: TextStyle(color: Colors.grey)),
          Text(
            "User Name",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      const Spacer(),
      IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications_none),
      ),
    ],
  );
}