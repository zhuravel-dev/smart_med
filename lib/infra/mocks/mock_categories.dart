import 'package:smart_med/domain/entities/category_summary_model.dart';
import 'package:smart_med_images/smart_med_images.dart';

final mockCategorySummaries = [
  CategorySummary(
    id: 1,
    doctorType: "Dentistry",
    workingHours: "10:20 AM - 4:40 PM",
    doctorsAvailable: 8,
    categoryImage: SmartMedImages.dentistry,
    doctorAvatars: SmartMedImages.defaultAvatarsDentistry,
    additionalCount: 3,
  ),
  CategorySummary(
    id: 2,
    doctorType: "Surgery",
    workingHours: "9:00 AM - 5:30 PM",
    doctorsAvailable: 7,
    categoryImage: SmartMedImages.surgery,
    doctorAvatars: SmartMedImages.defaultAvatarsSurgery,
    additionalCount: 2,
  ),
  CategorySummary(
    id: 3,
    doctorType: "Cardiology",
    workingHours: "10:20 AM - 4:40 PM",
    doctorsAvailable: 12,
    categoryImage: SmartMedImages.cardiology,
    doctorAvatars: SmartMedImages.defaultAvatarsDentistry,
    additionalCount: 6,
  ),
];
