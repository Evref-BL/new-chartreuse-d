class SingletonNodesChain {
  static Map<String, dynamic> _instance = <String, dynamic>{};

  // Private constructor to prevent external instantiation
  SingletonNodesChain._() {
    _instance.clear();
  }

  // Factory constructor to provide access to the singleton map
  factory SingletonNodesChain() {
    return SingletonNodesChain._();
  }

  static Map<String, dynamic> get instance => _instance;

  static String toCsv() {
    final buffer = StringBuffer();

    // Header row
    buffer.write('From,To,Occurrence\n');

    // Iterate through the map and append key-value pairs
    _instance.forEach((key, value) {
      buffer.write('${value[0]},${value[1]},${value[2]}\n');
    });

    return buffer.toString();
  }

  static String toMermaid() {
    final buffer = StringBuffer();

    // Header row
    buffer.write('graph TD\n');

    // Iterate through the map and append key-value pairs
    _instance.forEach((key, value) {
      buffer.write('\t${value[0]} -- ${value[2]} --> ${value[1]}\n');
    });

    return buffer.toString();
  }
}
