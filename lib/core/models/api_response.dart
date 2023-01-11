class Response {
  Response({required this.cod, required this.message, required this.rainData});

  String cod;
  int message;
  List<RainData> rainData;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        cod: json["cod"] ?? '',
        message: json["message"] ?? '',
        rainData:
            json["list"]?.map<RainData>((e) => RainData.fromJson(e)).toList() ??
                [],
      );

  Map<String, dynamic> toJson() =>
      {"cod": cod, "message": message, "list": rainData};
}

class RainData {
  RainData({required this.probability});

  int probability;

  factory RainData.fromJson(Map<String, dynamic> json) => RainData(
        probability: json["pop"] ?? 0,
      );
  Map<String, dynamic> toJson() => {"pop": probability};
}
