import 'dart:io';
import 'dart:convert';
import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/imports/classes/network/base/exceptions.dart';
import 'package:akwaaba_user_app/imports/database/models/users/login/main.dart';
import 'package:akwaaba_user_app/imports/functions/api/base_url/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/urls/api.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/days_dates/dates.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/days_dates/days.dart';
import 'package:akwaaba_user_app/models/users/login/main.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

final LoginUserModelDatabase _loginUserModelDatabase = LoginUserModelDatabase();

class AttendanceScheduleDaysAndDatesNetwork {
  static Future<Object> scheduleDates(
    int scheduleId, {
    Map<String, dynamic>? queryParameter,
  }) async {
    try {
      queryParameter = queryParameter ?? {};
      UserLoginModel? currentLogin = await _loginUserModelDatabase.getLogin();
      if (currentLogin == null) return Object();
      var headers = {
        'Authorization': 'Token ${currentLogin.token}',
        'Content-Type': 'application/json',
      };
      queryParameter["meetingEventId"] = scheduleId.toString();
      var url = Uri.parse(
              apiBaseUrlFunctions(DATES_ATTENDANCE_SCHEDULES_API_ENDPOINTS))
          .replace(queryParameters: queryParameter);
      var request = http.Request('GET', url);

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        // print({"responseBody": responseBody});
        List<dynamic> results = json.decode(responseBody)['results'];

        List<AttendanceScheduleDateModel> dates = [];
        for (var result in results) {
          // print({"result": result});
          AttendanceScheduleDateModel date =
              AttendanceScheduleDateModel.fromJson(result);
          // print({"date": date});
          if (!dates.contains(date)) {
            dates.add(date);
            // await _schedulesUserModelDatabase.addAttendanceSchedule(date);
          }
        }

        return NetworkSuccess(
          response: dates,
          code: response.statusCode,
        );
      } else {
        String reasonPhrase = response.reasonPhrase!;
        // print({"reasonPhrase": reasonPhrase, "responseBody": responseBody});
        return NetworkFailure(
          data: json.decode(responseBody),
          errorResponse: reasonPhrase,
          code: response.statusCode,
        );
      }
    } on SocketException catch (e) {
      final error = NoInternetException(
        message: "No Internt",
        exception: e,
      );
      return NetworkFailure(
        errorResponse: error,
        code: error.code,
      );
    } on HttpException catch (e) {
      final error = NoServiceFoundException(
        message: "No Service Found",
        exception: e,
      );
      return NetworkFailure(
        errorResponse: error,
        code: error.code,
      );
    } on FormatException catch (e) {
      final error = InvalidFormatException(
        message: "Invalid Data Format",
        exception: e,
      );
      return NetworkFailure(
        errorResponse: error,
        code: error.code,
      );
    } catch (e) {
      if (kDebugMode) {
        print({"e-e-e-e": e});
      }
      final error = Exception(e);
      return NetworkFailure(
        errorResponse: error,
        code: error.hashCode,
      );
    }
  }

  static Future<Object> scheduleDate(
    int dateId, {
    Map<String, dynamic>? queryParameter,
  }) async {
    try {
      queryParameter = queryParameter ?? {};
      UserLoginModel? currentLogin = await _loginUserModelDatabase.getLogin();
      if (currentLogin == null) return Object();
      var headers = {
        'Authorization': 'Token ${currentLogin.token}',
        'Content-Type': 'application/json',
      };
      var url = Uri.parse(
          "${apiBaseUrlFunctions(DATES_ATTENDANCE_SCHEDULES_API_ENDPOINTS)}/$dateId");
      var request = http.Request('GET', url);

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        // print({"responseBody": responseBody});
        dynamic responseResponse = json.decode(responseBody);
        bool success = responseResponse['success'];
        AttendanceScheduleDateModel? date;
        if (success) {
          Map<String, dynamic> data = responseResponse['data'] as Map<String, dynamic>;
          date = AttendanceScheduleDateModel.fromJson(data);
          // print({"date": date});
          // await _schedulesUserModelDatabase.addAttendanceSchedule(date);
        }

        return NetworkSuccess(
          response: date,
          code: response.statusCode,
        );
      } else {
        String reasonPhrase = response.reasonPhrase!;
        // print({"reasonPhrase": reasonPhrase, "responseBody": responseBody});
        return NetworkFailure(
          data: json.decode(responseBody),
          errorResponse: reasonPhrase,
          code: response.statusCode,
        );
      }
    } on SocketException catch (e) {
      final error = NoInternetException(
        message: "No Internt",
        exception: e,
      );
      return NetworkFailure(
        errorResponse: error,
        code: error.code,
      );
    } on HttpException catch (e) {
      final error = NoServiceFoundException(
        message: "No Service Found",
        exception: e,
      );
      return NetworkFailure(
        errorResponse: error,
        code: error.code,
      );
    } on FormatException catch (e) {
      final error = InvalidFormatException(
        message: "Invalid Data Format",
        exception: e,
      );
      return NetworkFailure(
        errorResponse: error,
        code: error.code,
      );
    } catch (e) {
      if (kDebugMode) {
        print({"e-e-e-e": e});
      }
      final error = Exception(e);
      return NetworkFailure(
        errorResponse: error,
        code: error.hashCode,
      );
    }
  }

  static Future<Object> scheduleDays(
    int scheduleId, {
    Map<String, dynamic>? queryParameter,
  }) async {
    try {
      queryParameter = queryParameter ?? {};
      UserLoginModel? currentLogin = await _loginUserModelDatabase.getLogin();
      if (currentLogin == null) return Object();
      var headers = {
        'Authorization': 'Token ${currentLogin.token}',
        'Content-Type': 'application/json',
      };
      var url = Uri.parse(
          "${apiBaseUrlFunctions(DAYS_ATTENDANCE_SCHEDULES_API_ENDPOINTS)}?meetingEventId=$scheduleId");
      var request = http.Request('GET', url);

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        // print({"responseBody": responseBody});
        dynamic responseResponse = json.decode(responseBody);
        // print({"response": response});
        bool success = responseResponse['success'];
        List<AttendanceScheduleDayModel> days = [];
        if (success) {
          List<dynamic> results = responseResponse['data'];
          // print({"results": results});

          for (var result in results) {
            // print({"result": result});
            AttendanceScheduleDayModel day =
                AttendanceScheduleDayModel.fromJson(result);
            // print({"day": day});
            if (!days.contains(day)) {
              days.add(day);
              // await _schedulesUserModelDatabase.addAttendanceSchedule(day);
            }
          }
        }

        return NetworkSuccess(
          response: days,
          code: response.statusCode,
        );
      } else {
        String reasonPhrase = response.reasonPhrase!;
        // print({"reasonPhrase": reasonPhrase, "responseBody": responseBody});
        return NetworkFailure(
          data: json.decode(responseBody),
          errorResponse: reasonPhrase,
          code: response.statusCode,
        );
      }
    } on SocketException catch (e) {
      final error = NoInternetException(
        message: "No Internt",
        exception: e,
      );
      return NetworkFailure(
        errorResponse: error,
        code: error.code,
      );
    } on HttpException catch (e) {
      final error = NoServiceFoundException(
        message: "No Service Found",
        exception: e,
      );
      return NetworkFailure(
        errorResponse: error,
        code: error.code,
      );
    } on FormatException catch (e) {
      final error = InvalidFormatException(
        message: "Invalid Data Format",
        exception: e,
      );
      return NetworkFailure(
        errorResponse: error,
        code: error.code,
      );
    } catch (e) {
      if (kDebugMode) {
        print({"e-e-e-e": e});
      }
      final error = Exception(e);
      return NetworkFailure(
        errorResponse: error,
        code: error.hashCode,
      );
    }
  }
}
