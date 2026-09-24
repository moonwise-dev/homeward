import 'parsed_output.dart';

abstract interface class OutputParser {
  List<ParsedOutput> add(String delta);

  List<ParsedOutput> close();
}
