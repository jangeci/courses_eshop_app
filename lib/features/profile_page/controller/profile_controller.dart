import 'package:courses_eshop_app/global.dart';
import 'package:courses_eshop_app/models/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  @override
  UserProfileModel build() => Global.storageService.getUserProfile();
}
