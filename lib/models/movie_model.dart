import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/movie_type_enum.dart';

part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

T? toNull<T>(_) => null;
double? ratingFromJson(String rating) => double.tryParse(rating);

@freezed
class MovieModel with _$MovieModel {

  @JsonSerializable(fieldRename: FieldRename.snake)
  factory MovieModel({
    @JsonKey(toJson: toNull, includeIfNull: false)
    required int movieId,
    required int year,
    required String title,
    required String summary,
    required String trailerUrl,
    required String posterUrl,
    @JsonKey(fromJson: ratingFromJson)
    required double? rating,
    required MovieType movieType,
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
}
