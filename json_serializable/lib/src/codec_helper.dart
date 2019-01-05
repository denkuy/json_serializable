import 'helper_core.dart';

abstract class CodecHelper implements HelperCore {

  Iterable<String> createCodecs() sync* {
    yield '''class ${element.name}Encoder extends Converter<${element.name}, Map<String, dynamic>> {
  Map<String, dynamic> convert(${element.name} input) => ${prefix}ToJson(input);
}''';

    yield '''class ${element.name}Decoder extends Converter<Map<String, dynamic>, ${element.name}> {
  ${element.name} convert(Map<String, dynamic> input) => ${prefix}FromJson(input);
}''';

    yield '''class ${element.name}Codec extends Codec<${element.name}, Map<String, dynamic>> {
  Converter<Map<String, dynamic>, ${element.name}> get decoder => ${element.name}Decoder();
  Converter<${element.name}, Map<String, dynamic>> get encoder => ${element.name}Encoder();
}''';
  }
}