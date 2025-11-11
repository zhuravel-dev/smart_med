import 'package:flutter/material.dart';
import 'package:smart_med/infra/helpers/consultation_type.dart';
import 'package:smart_med/presentation/components/visit_type_card/consultation_tile.dart';
import 'package:smart_med/presentation/components/visit_type_card/custom_plus_button.dart';
import 'package:smart_med/presentation/components/visit_type_card/visit_type_text_item.dart';

class VisitTypeCard extends StatefulWidget {
  const VisitTypeCard({super.key});

  @override
  _VisitTypeCardState createState() => _VisitTypeCardState();
}

class _VisitTypeCardState extends State<VisitTypeCard> {
  int selectedOption = -1;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.27,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF4285F4), Color(0xFF3367D6)],
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(56),
            topRight: Radius.circular(56),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [VisitTypeTextItem(), CustomPlusButton()],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ConsultationTile(
                    type: ConsultationType.urgent,
                    duration: '30 min',
                    isSelected: selectedOption == 0,
                    onTap: () {
                      setState(() {
                        selectedOption = 0;
                      });
                    },
                  ),
                  SizedBox(width: 6),
                  ConsultationTile(
                    type: ConsultationType.scheduled,
                    duration: '1 h',
                    isSelected: selectedOption == 1,
                    onTap: () {
                      setState(() {
                        selectedOption = 1;
                      });
                    },
                  ),
                  SizedBox(height: 42),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
