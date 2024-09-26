class AuthPostmodel {
  String? otp;
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  String? emailOrPhone;

  AuthPostmodel(
      {this.otp,
      this.name,
      this.email,
      this.phoneNumber,
      this.password,
      this.emailOrPhone});

  factory AuthPostmodel.fromJson(Map<String, dynamic> json) {
    return AuthPostmodel(
      otp: json['otp'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      password: json['password'] as String?,
      emailOrPhone: json['email_or_phone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (otp != null) data['otp'] = otp;
    if (name != null) data['name'] = name;
    if (email != null) data['email'] = email;
    if (phoneNumber != null) data['phone_number'] = phoneNumber;
    if (password != null) data['password'] = password;
    if (emailOrPhone != null) data['email_or_phone'] = emailOrPhone;
    return data;
  }

  AuthPostmodel copyWith({
    String? otp,
    String? name,
    String? email,
    String? phoneNumber,
    String? password,
  }) {
    return AuthPostmodel(
      otp: otp ?? this.otp,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
    );
  }
}
