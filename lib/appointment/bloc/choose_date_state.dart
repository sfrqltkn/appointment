class ChooseDateState {
  final bool isLoading;
  final String? errorMessage;
  final bool isCreated;

  ChooseDateState(
      {this.isLoading = false, this.errorMessage, this.isCreated = false});

  ChooseDateState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isCreated,
  }) {
    return ChooseDateState(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        isCreated: isCreated ?? this.isCreated);
  }
}
