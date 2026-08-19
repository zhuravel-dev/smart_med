import 'package:equatable/equatable.dart';

class CategorySummary extends Equatable {
  final int id;
  final String doctorType;
  final String workingHours;
  final int doctorsAvailable;
  final String categoryImage;
  final List<String> doctorAvatars;
  final int additionalCount;

  const CategorySummary({
    required this.id,
    required this.doctorType,
    required this.workingHours,
    required this.doctorsAvailable,
    required this.categoryImage,
    required this.doctorAvatars,
    required this.additionalCount,
  });

  @override
  List<Object?> get props => [
    id,
    doctorType,
    workingHours,
    doctorsAvailable,
    categoryImage,
    doctorAvatars,
    additionalCount,
  ];
}
