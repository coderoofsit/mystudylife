import 'package:flutter/material.dart';

/// Segmented control (tabs) matching the green pill style used across study flows.
class SegmentTabControl extends StatelessWidget {
  const SegmentTabControl({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onChanged,
    this.minHeight = 42,
  });

  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  final double minHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(color: const Color(0xFFCBEBD8), borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: List.generate(labels.length, (i) {
          final selected = i == selectedIndex;
          return Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => onChanged(i),
                child: Container(
                  constraints: BoxConstraints(minHeight: minHeight),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: selected ? const Color(0xFF24C55E) : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  child: Text(
                    labels[i],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      height: 1.2,
                      color: selected ? Colors.white : const Color(0xFF2B5138),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

/// Reusable bordered dropdown styled like the legacy static row.
class StudyStyledDropdown<T> extends StatelessWidget {
  const StudyStyledDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hint,
  });

  final T value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        width: double.infinity,
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
        child: DropdownButton<T>(
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down, size: 22),
          borderRadius: BorderRadius.circular(12),
          items: items,
          onChanged: onChanged,
          hint: hint != null ? Text(hint!) : null,
        ),
      ),
    );
  }
}

/// Single-select chip row / wrap used in Personalize and Schedule Setup.
class StudyChoiceChipGroup extends StatelessWidget {
  const StudyChoiceChipGroup({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onChanged,
    this.outlined = false,
  });

  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(labels.length, (i) {
        final isSelected = i == selectedIndex;
        return Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () => onChanged(i),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF24C55E) : const Color(0xFFCFF0DC),
                borderRadius: BorderRadius.circular(14),
                border: outlined && isSelected ? Border.all(color: const Color(0xFF24C55E), width: 2) : null,
              ),
              child: Text(
                labels[i],
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: isSelected ? Colors.white : const Color(0xFF2A975F),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

/// White rounded text field sharing the same visual language as placeholder rows.
class StudyStyledTextField extends StatelessWidget {
  const StudyStyledTextField({
    super.key,
    this.controller,
    this.initialValue,
    this.hintText,
    this.minLines = 1,
    this.maxLines = 1,
    this.onChanged,
    this.keyboardType,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final String? hintText;
  final int minLines;
  final int maxLines;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: controller == null ? initialValue : null,
      minLines: minLines,
      maxLines: maxLines,
      keyboardType: keyboardType,
      onChanged: onChanged,
      style: const TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF1F2937)),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFF8B929C)),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
      ),
    );
  }
}

/// Row with title + switch for settings / reminders.
class ReminderGroupCard extends StatelessWidget {
  const ReminderGroupCard({
    super.key,
    required this.title,
    required this.enabled,
    required this.onEnabledChanged,
    required this.leadOptions,
    required this.selectedLeadIndex,
    required this.onLeadChanged,
  });

  final String title;
  final bool enabled;
  final ValueChanged<bool> onEnabledChanged;
  final List<String> leadOptions;
  final int selectedLeadIndex;
  final ValueChanged<int> onLeadChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17))),
              Switch.adaptive(value: enabled, onChanged: onEnabledChanged),
            ],
          ),
          const Text(
            'How many minutes before your class would you like to receive a reminder.',
            style: TextStyle(color: Color(0xFF5E6670)),
          ),
          const SizedBox(height: 8),
          const Text('Remind Me Before', style: TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          StudyStyledDropdown<int>(
            value: selectedLeadIndex.clamp(0, leadOptions.length - 1),
            items: List.generate(
              leadOptions.length,
              (i) => DropdownMenuItem(value: i, child: Text(leadOptions[i])),
            ),
            onChanged: (v) {
              if (!enabled || v == null) return;
              onLeadChanged(v);
            },
          ),
        ],
      ),
    );
  }
}

class AppSwitchTile extends StatelessWidget {
  const AppSwitchTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.subtitle,
  });

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17)),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(subtitle!, style: const TextStyle(color: Color(0xFF5E6670), fontSize: 13)),
                ],
              ],
            ),
          ),
          Switch.adaptive(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
