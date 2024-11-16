import 'package:movies/core/entities/keyword_entity.dart';
import 'package:movies/core/models/keyword_model.dart';

class KeywordMapper {
  static KeywordEntity toEntity(KeywordModel keywordModel) {
    return KeywordEntity(
      name: keywordModel.name,
      id: keywordModel.id,
    );
  }
}
