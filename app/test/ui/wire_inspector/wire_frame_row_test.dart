import 'package:flutter_test/flutter_test.dart';
import 'package:homeward/ui/wire_inspector/widgets/wire_frame_row.dart';

void main() {
  test('a frame size reads in bytes until a kilobyte is clearer', () {
    expect(byteSize(0), '0 B');
    expect(byteSize(999), '999 B');
    expect(byteSize(1000), '1.0 kB');
    expect(byteSize(2480), '2.5 kB');
    expect(byteSize(148000), '148 kB');
  });

  test('a gap between frames reads in milliseconds, then in seconds', () {
    expect(elapsedLabel(const Duration(milliseconds: 8)), '8 ms');
    expect(elapsedLabel(const Duration(milliseconds: 999)), '999 ms');
    expect(elapsedLabel(const Duration(milliseconds: 1500)), '1.5 s');
  });
}
