class UnreadCounts {
  Map<String, int>? unreadCounts;

  UnreadCounts({
    this.unreadCounts,
  });

  // Factory constructor to create an instance from a JSON map
  factory UnreadCounts.fromJson(Map<String, dynamic> json) {
    return UnreadCounts(
      unreadCounts: (json['unread_counts'] as Map<String, dynamic>?)?.map(
        (key, value) => MapEntry(key, value as int),
      ),
    );
  }

  // Method to convert the instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'unread_counts': unreadCounts,
    };
  }
}
