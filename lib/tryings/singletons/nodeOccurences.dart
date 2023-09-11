class SingletonOccurrences {
  static Map<String, dynamic> _instance = <String, dynamic>{};

  // Private constructor to prevent external instantiation
  SingletonOccurrences._() {
    _instance.clear();
  }

  // Factory constructor to provide access to the singleton map
  factory SingletonOccurrences() {
    return SingletonOccurrences._();
  }

  static Map<String, dynamic> get instance => _instance;

  static String toCsv() {
    final buffer = StringBuffer();

    // Header row
    buffer.write('Key,Value\n');

    // Iterate through the map and append key-value pairs
    _instance.forEach((key, value) {
      buffer.write('$key,$value\n');
    });

    return buffer.toString();
  }
}
