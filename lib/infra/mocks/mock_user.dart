import 'package:smart_med/domain/entities/user_model.dart';
import 'package:smart_med_images/smart_med_images.dart';

final mockUsers = [
  UserModel(
    id: 1,
    firstName: "John",
    lastName: "Doe",
    email: "alex.morgan@example.com",
    phoneNumber: "+1234567890",
  ),
];

final userAvatar = {1: SmartMedImages.user};
