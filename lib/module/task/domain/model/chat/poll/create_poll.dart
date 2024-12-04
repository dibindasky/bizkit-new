class CreatePoll {
  final String? messageType;
  final String? question;
  final List<String>? answers;
  final bool? isMultipleSelectionAllowed;
  final bool? isAnonymousVotingAllowed;
  final bool? isReasonRequired;
  final String? activeUntil;
  String? localId;

  CreatePoll({
    this.messageType,
    this.question,
    this.answers,
    this.isMultipleSelectionAllowed,
    this.isAnonymousVotingAllowed,
    this.isReasonRequired,
    this.activeUntil,
    this.localId,
  });

  // Convert a CreatePoll instance to a Map
  Map<String, dynamic> toJson() {
    return {
      'message_type': messageType,
      'question': question,
      'answers': answers,
      'is_multiple_selection_allowed': isMultipleSelectionAllowed,
      'is_anonymous_voting_allowed': isAnonymousVotingAllowed,
      'is_reason_required': isReasonRequired,
      'active_until': activeUntil,
      'local_id': localId,
    };
  }

  // Create a CreatePoll instance from a Map
  factory CreatePoll.fromJson(Map<String, dynamic> json) {
    return CreatePoll(
      messageType: json['message_type'] as String?,
      question: json['question'] as String?,
      answers: (json['answers'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      isMultipleSelectionAllowed:
          json['is_multiple_selection_allowed'] as bool?,
      isAnonymousVotingAllowed: json['is_anonymous_voting_allowed'] as bool?,
      isReasonRequired: json['is_reason_required'] as bool?,
      activeUntil: json['active_until'] as String?,
      localId: json['local_id'] as String?,
    );
  }
}
