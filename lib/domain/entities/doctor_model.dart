class Doctor {
  final int id;
  final String firstName;
  final String lastName;
  final String specialization;
  final int experienceYears;
  final double rating;
  final List<String> reviews;
  final String workingHours;
  final int patientsCount;
  final int recoveredPatients;
  final int inCare;
  final int free;
  final String aboutMe;

  Doctor({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.specialization,
    required this.experienceYears,
    required this.rating,
    required this.reviews,
    required this.workingHours,
    required this.patientsCount,
    required this.recoveredPatients,
    required this.inCare,
    required this.free,
    required this.aboutMe,
  });

  Doctor copyWith({
    String? firstName,
    String? lastName,
    String? specialization,
    int? experienceYears,
    double? rating,
    List<String>? reviews,
    String? workingHours,
    int? patientsCount,
    int? recoveredPatients,
    int? inCare,
    int? free,
    String? aboutMe,
  }) {
    return Doctor(
      id: id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      specialization: specialization ?? this.specialization,
      experienceYears: experienceYears ?? this.experienceYears,
      rating: rating ?? this.rating,
      reviews: reviews ?? this.reviews,
      workingHours: workingHours ?? this.workingHours,
      patientsCount: patientsCount ?? this.patientsCount,
      recoveredPatients: recoveredPatients ?? this.recoveredPatients,
      inCare: inCare ?? this.inCare,
      free: free ?? this.free,
      aboutMe: aboutMe ?? this.aboutMe,
    );
  }
}
