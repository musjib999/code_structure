import 'package:template/presentation/widgets/widgets.dart';

import '../../../domain/models/models.dart';

AppUser dummyUser = AppUser(
  id: "1",
  firstName: "Muhammad",
  lastName: "Ibrahim",
  email: "muhammad.ibra@example.com",
  phone: "+2347023456789",
  password: "password123",
  userRole: "admin",
  updatedAt: DateTime.now(),
  createdAt: DateTime.now(),
  subId: "sub123",
  profilePicture: AppAssets.defaultPic,
  dateOfBirth: "1990-01-01",
  gender: "male",
  isEmailVerified: true,
);
