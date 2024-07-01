extension StringExtensions on String {
  String get trim => this.trim();

  String get firstCap {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }

  String get titleCase {
    if (isEmpty) {
      return this;
    }
    return split('.').map((sentence) => sentence.firstCap).join('. ');
  }
}
