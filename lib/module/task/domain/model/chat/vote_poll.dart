class VotePoll {
  final String? messageType;
  final String? pollId;
  final List<String>? answerIds;
  final Map<String, String>? reasons;

  VotePoll({
    this.messageType = 'vote_poll',
    this.pollId,
    this.answerIds,
    this.reasons,
  });

  // Convert a VotePoll instance to a Map
  Map<String, dynamic> toJson() {
    return {
      'message_type': messageType,
      'poll_id': pollId,
      'answer_ids': answerIds,
      'reasons': reasons,
    };
  }

  // Create a VotePoll instance from a Map
  factory VotePoll.fromJson(Map<String, dynamic> json) {
    return VotePoll(
      messageType: json['message_type'] as String?,
      pollId: json['poll_id'] as String?,
      answerIds: (json['answer_ids'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      reasons: (json['reasons'] as Map<String, dynamic>?)
          ?.map((key, value) => MapEntry(key, value as String)),
    );
  }
}
