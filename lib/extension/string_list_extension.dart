extension StringListExtension on List<String> {
  String toCommaSeparated() {
    return this.join(',');
  }
}
