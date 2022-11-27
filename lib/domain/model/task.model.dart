class Task {
  final String title;

  bool _isResolved = false;

  bool get isResolved => _isResolved;

  void setIsResolved() {
    _isResolved = true;
  }

  Task({
    required this.title,
  });
}
