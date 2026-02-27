import 'package:flutter/cupertino.dart';
import 'package:smart_med/domain/entities/doctor_model.dart';

class DoctorImage extends StatelessWidget {
  final Doctor doctor;
  final double width;
  final double height;
  final double borderRadius;
  final BoxFit fit;
  final Alignment alignment;

  const DoctorImage({
    super.key,
    required this.doctor,
    this.width = 90,
    this.height = 90,
    this.borderRadius = 16,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: SizedBox(
        width: width,
        height: height,
        child: Image.asset(doctor.image, fit: fit, alignment: alignment),
      ),
    );
  }
}
