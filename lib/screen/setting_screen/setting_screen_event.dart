import 'package:equatable/equatable.dart';

abstract class SettingScreenEvent extends Equatable {}

// 画面の開始を通知
class SettingScreenStartedEvent extends SettingScreenEvent {
  @override
  String toString() => 'SettingScreenStartedEvent';
}
