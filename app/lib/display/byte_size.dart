String byteSize(int bytes) => switch (bytes) {
  < 1000 => '$bytes B',
  < 100000 => '${(bytes / 1000).toStringAsFixed(1)} kB',
  _ => '${(bytes / 1000).round()} kB',
};
