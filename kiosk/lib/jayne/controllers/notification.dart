import 'dart:io';
import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kiosk/jayne/common/action.dart';
import 'package:kiosk/jayne/controllers/send_message_stream.dart';
import 'package:kiosk/jayne/model/message/response_message_stream_controller.dart';

const countDownOneMinute = 60;

class Notification {
  static final Notification _instance = Notification._internal();

  factory Notification() => _instance;

  Notification._internal() {
    _initialize();
  }

  void _initialize() {
    _initializeNotificationChannel();
    _requestPermission();
  }

  Future<void> _initializeNotificationChannel() async {
    AwesomeNotifications().initialize(null, [
      NotificationChannel(
        channelKey: 'scheduled',
        channelName: 'Basic Notification',
        channelDescription: 'Notification Channel',
        defaultColor: const Color(0xFFB00051),
        ledColor: const Color(0xFFB00051),
        locked: true,
      )
    ]);
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod: NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod: NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: NotificationController.onDismissActionReceivedMethod,
    );
  }

  void _basicChannelNotification() {
    if (Platform.isAndroid) {
      AwesomeNotifications().initialize('resource://mipmap/ic_launcher', [
        NotificationChannel(
          channelGroupKey: "basic_channel_group",
          channelKey: 'basic_channel',
          channelName: 'Basic Notification',
          channelDescription: 'Notification Channel',
          defaultColor: const Color(0xFFB00051),
          ledColor: const Color(0xFFB00051),
          locked: true,
        )
      ], channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: "basic_channel_group",
          channelGroupName: "Basic Group",
        )
      ]);
    } else {
      AwesomeNotifications().initialize(null, [
        NotificationChannel(
          channelGroupKey: "basic_channel_group",
          channelKey: 'basic_channel',
          channelName: 'Basic Notification',
          channelDescription: 'Notification Channel',
          defaultColor: const Color(0xFFB00051),
          ledColor: const Color(0xFFB00051),
          locked: true,
        )
      ], channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: "basic_channel_group",
          channelGroupName: "Basic Group",
        )
      ]);
    }
  }

  void _requestPermission() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  void createNotification(
      int id,
      String title,
      String body,
      ) {
    _basicChannelNotification();
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'basic_channel',
        title: title,
        body: body,
        displayOnForeground: true,
        displayOnBackground: true,
        wakeUpScreen: true,
        payload: {
          'key': 'jayne',
        },
      ),
    );
  }

  Future<void> scheduleNotification(
      int id,
      String title,
      String body,
      ) async {
    final localTimeZone = await AwesomeNotifications().getLocalTimeZoneIdentifier();
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'scheduled',
        title: title,
        body: body,
        displayOnForeground: true,
        displayOnBackground: true,
        wakeUpScreen: true,
        payload: {
          'key': 'jayne',
        },
      ),
      schedule: NotificationInterval(
        interval: countDownOneMinute,
        timeZone: localTimeZone,
        repeats: false,
      ),
    );
  }

  void sendNotification() {
    Notification().createNotification(
      1,
      "jayne.notification.time_out.title".tr(),
      "jayne.notification.time_out.description".tr(),
    );
  }

  void _cancelNotification() {
    AwesomeNotifications().cancel(1);
  }

  void cancelNotification() {
    _cancelNotification();
  }
}

class NotificationController {
  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(ReceivedNotification receivedNotification) async {}

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(ReceivedNotification receivedNotification) async {}

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(ReceivedAction receivedAction) async {}

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    Map<String, String?> payload = receivedAction.payload ?? {};
    if (payload.isNotEmpty) {
      if (payload.values.contains("jayne")) {
        gotoChatBotByClickNotification();
      } else {
        gotoOtherNotification(payload: payload);
      }
    } else {
      debugPrint("$payload not implemented yet");
    }
  }
}

void gotoChatBotByClickNotification() {
  final sendMessageStream = SendMessageStream();
  var responseMessageStreamController = ResponseMessageStreamController(
    actionStatus: KeptActionName.gotoChatBotByClickNotification,
  );
  sendMessageStream.sendDataWebsocket(responseMessageStreamController);
}

void gotoOtherNotification({
  required Map<String, String?> payload,
}) {
  final sendMessageStream = SendMessageStream();
  var responseMessageStreamController = ResponseMessageStreamController(
    actionStatus: KeptActionName.gotoOtherNotification,
  );
  sendMessageStream.sendDataWebsocket(responseMessageStreamController);
}