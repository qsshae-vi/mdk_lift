class OkeanEventDto {
  final int code;
  final DateTime start;
  final DateTime? end;

  const OkeanEventDto({
    required this.code,
    required this.start,
    required this.end,
  });

  factory OkeanEventDto.fromJson(Map<String, dynamic> json) {
    return OkeanEventDto(
      code: json['code'] as int,
      start: DateTime.parse(json['start'] as String),
      end: json['end'] == null
          ? null
          : DateTime.parse(json['end'] as String),
    );
  }

  bool get isActive => end == null;
}

