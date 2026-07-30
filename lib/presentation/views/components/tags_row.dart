import 'package:flutter/material.dart';
import 'package:smart_med/presentation/views/components/tag_item.dart';

class TagsRow extends StatefulWidget {
  final String selectedTag;
  final ValueChanged<String>? onTagSelected;

  const TagsRow({
    super.key,
    this.selectedTag = "All",
    this.onTagSelected,
  });

  @override
  State<TagsRow> createState() => _TagsRowState();
}

class _TagsRowState extends State<TagsRow> {
  late String _selectedTag;

  final List<String> _tags = ["All", "Dentistry", "Surgery", "Cardiology"];

  @override
  void initState() {
    super.initState();
    _selectedTag = widget.selectedTag;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _tags.map((tag) {
          final isSelected = tag == _selectedTag;
          return Padding(
            padding: const EdgeInsets.only(right: 14),
            child: TagItem(
              tag,
              selected: isSelected,
              onTap: () {
                setState(() {
                  _selectedTag = tag;
                });
                if (widget.onTagSelected != null) {
                  widget.onTagSelected!(tag);
                }
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
