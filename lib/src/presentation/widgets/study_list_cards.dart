import 'package:flutter/material.dart';

import '../../domain/models/study_models.dart';

/// List row used by Tasks, Classes, Exams (shared layout).
class StudyListItemCard extends StatelessWidget {
  const StudyListItemCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.right,
    required this.chip,
    required this.accentColor,
    this.chipTint = const Color(0xFFE5F7EA),
    this.chipText = const Color(0xFF236847),
  });

  final String title;
  final String subtitle;
  final String right;
  final String chip;
  final Color accentColor;
  final Color chipTint;
  final Color chipText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(width: 5, height: 52, decoration: BoxDecoration(color: accentColor, borderRadius: BorderRadius.circular(99))),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17))),
                    Text(right, style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF4E5561))),
                  ],
                ),
                Text(subtitle, style: const TextStyle(fontSize: 13, color: Color(0xFF5E6670))),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(color: chipTint, borderRadius: BorderRadius.circular(6)),
                  child: Text(chip, style: TextStyle(fontWeight: FontWeight.w700, color: chipText, fontSize: 12)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StudyManageSubjectCard extends StatelessWidget {
  const StudyManageSubjectCard({super.key, required this.item});

  final ManageSubjectRow item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(width: 5, height: 60, decoration: BoxDecoration(color: item.color, borderRadius: BorderRadius.circular(99))),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, letterSpacing: 0.8)),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(color: const Color(0xFFE5F7EA), borderRadius: BorderRadius.circular(8)),
                  child: const Text('Edit', style: TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF24A660))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StudyXtraListCard extends StatelessWidget {
  const StudyXtraListCard({
    super.key,
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.chip,
  });

  final String emoji;
  final String title;
  final String subtitle;
  final String time;
  final String chip;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: const Color(0xFFE1F7E9), borderRadius: BorderRadius.circular(12)),
            child: Text(emoji, style: const TextStyle(fontSize: 24)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                Text(subtitle, style: const TextStyle(color: Color(0xFF5E6670))),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(color: const Color(0xFFE5F7EA), borderRadius: BorderRadius.circular(6)),
                  child: Text(chip, style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF236847), fontSize: 12)),
                ),
              ],
            ),
          ),
          Text(time, style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF4E5561))),
        ],
      ),
    );
  }
}
