class HomeState {
  bool isLoading;
  bool isPostLoading;
  bool isError;

  HomeState({
    this.isLoading = true,
    this.isPostLoading = false,
    this.isError = false,
  });

  HomeState copyWith({
    bool? isLoading,
    bool? isPostLoading,
    bool? isError,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      isPostLoading: isPostLoading ?? this.isPostLoading,
      isError: isError ?? this.isError,
    );
  }
}
