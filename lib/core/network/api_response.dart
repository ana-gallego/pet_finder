import 'dart:convert';

/// The `ApiResponse` class is used to represent generic API responses that
/// contain information about the success of the request, an explanatory message,
/// and optional data related to the response.
///
/// This class is parameterized with the data type `T`, which represents the type of
/// data contained in the `data` property.
class ApiResponse<T> {
  /// Creates a new instance of `ApiResponse`.
  ///
  /// - [success]: A boolean indicator representing whether the request was successful.
  /// - [message]: A message related to the API response.
  /// - [data]: Optional data of type `T` contained in the response.
  ApiResponse({
    required this.success,
    required this.message,
    this.data,
  });

  /// Creates an instance of `ApiResponse` from a JSON representation in string format.
  ///
  /// - [str]: JSON string representing the API response.
  factory ApiResponse.fromRawJson(String str) =>
      ApiResponse.fromJson(json.decode(str) as Map<String, dynamic>);

  /// Creates an instance of `ApiResponse` from a JSON map.
  ///
  /// - [json]: JSON map containing the data of the API response.
  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        success: json['success'] as bool,
        message: json['message'] as String,
        data: json['data'] as T?,
      );

  /// A boolean indicator representing whether the request was successful.
  bool success;

  /// A message related to the API response.
  String message;

  /// Optional data of type `T` contained in the response.
  T? data;

  /// Converts the `ApiResponse` instance into a JSON representation in string format.
  ///
  /// Returns: A JSON string representing the `ApiResponse` instance.
  String toRawJson() => json.encode(toJson());

  /// Converts the `ApiResponse` instance into a JSON map.
  ///
  /// Returns: A JSON map containing the data of the `ApiResponse` instance.
  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data,
      };
}
