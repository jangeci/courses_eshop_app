import 'package:courses_eshop_app/features/buy_course/controller/buy_course_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class BuyCourseScreen extends ConsumerStatefulWidget {
  static const kRoute = '/buy-course';

  const BuyCourseScreen({super.key});

  @override
  ConsumerState<BuyCourseScreen> createState() => _BuyCourseScreenState();
}

class _BuyCourseScreenState extends ConsumerState<BuyCourseScreen> {
  late int id;
  late WebViewController webViewController;

  @override
  void didChangeDependencies() {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    id = args['id'];

    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }
    webViewController = WebViewController.fromPlatformCreationParams(params);

    webViewController.setJavaScriptMode(JavaScriptMode.unrestricted);
    webViewController.addJavaScriptChannel(
      'Pay',
      onMessageReceived: (JavaScriptMessage message) {
        print('--------- message received --------');
        print(message.message);
        Navigator.of(context).pop(message.message);
      },
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var courseBuy = ref.watch(buyCourseControllerProvider(id: id));

    return Scaffold(
      appBar: AppBar(),
      body: courseBuy.when(
        data: (data) {
          if (data == null || data.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: const Text(
                  'Order already exists or something went wrong',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          webViewController.loadRequest(Uri.parse(data));
          return WebViewWidget(
            controller: webViewController,
          );
        },
        error: (error, stackTrace) {
          print(error);
          return const Text(
            'Error getting webview',
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
