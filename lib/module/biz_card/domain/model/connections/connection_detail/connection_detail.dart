class ConnectionDetail {
  final String? connectionId;
  final String? notes;
  final List<String>? selfie;
  final String? occasion;
  final String? location;
  final String? category;

  ConnectionDetail({
    this.connectionId,
    this.notes,
    this.selfie,
    this.occasion,
    this.location,
    this.category,
  });

  factory ConnectionDetail.fromJson(Map<String, dynamic> json) {
    return ConnectionDetail(
      connectionId: json['connection_id'] as String?,
      notes: json['notes'] as String?,
      selfie:
          (json['selfie'] as List<dynamic>?)?.map((e) => e as String).toList(),
      occasion: json['occasion'] as String?,
      location: json['location'] as String?,
      category: json['category'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (notes != null && notes!.isNotEmpty) data['notes'] = notes;
    if (selfie != null && selfie!.isNotEmpty) data['selfie'] = selfie;
    if (occasion != null && occasion!.isNotEmpty) data['occasion'] = occasion;
    if (location != null && location!.isNotEmpty) data['location'] = location;
    if (category != null && category!.isNotEmpty) data['category'] = category;
    if (connectionId != null && connectionId!.isNotEmpty)
      data['connection_id'] = connectionId;
    return data;
  }
}
