class ProfileModel {
  String? otp;
  String? name;
  String? email;
  String? phoneNumber;
  String? profileImage;

  ProfileModel({
    this.otp,
    this.name,
    this.email,
    this.phoneNumber,
    this.profileImage,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      otp: json['otp'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      profileImage: json['profile_picture'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (otp != null) data['otp'] = otp;
    if (name != null) data['name'] = name;
    if (email != null) data['email'] = email;
    if (phoneNumber != null) data['phone_number'] = phoneNumber;
    if (profileImage != null) data['profile_picture'] = profileImage;
    return data;
  }
}
