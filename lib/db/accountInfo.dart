import 'package:hive/hive.dart';

part 'accountInfo.g.dart';

@HiveType(typeId: 0)
class AccountInfo extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String nickname;

  AccountInfo({ this.nickname });
}