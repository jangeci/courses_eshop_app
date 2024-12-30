import 'package:courses_eshop_app/common/widgets/app_bar.dart';
import 'package:courses_eshop_app/features/profile_page/view/widgets/profile_courses_widget.dart';
import 'package:courses_eshop_app/features/profile_page/view/widgets/profile_list_items_widget.dart';
import 'package:courses_eshop_app/features/profile_page/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: 'Profile',
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              ProfileImageWidget(),
              ProfileNameWidget(),
              ProfileCoursesWidget(),
              ProfileListItemsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
