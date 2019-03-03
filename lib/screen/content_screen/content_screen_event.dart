import 'package:equatable/equatable.dart';

abstract class ContentScreenEvent extends Equatable {}

// 画面の開始を通知
class ContentScreenStartedEvent extends ContentScreenEvent {
  @override
  String toString() => 'ContentScreenStartedEvent';
}
