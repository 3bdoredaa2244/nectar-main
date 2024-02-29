import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nectar/core/payment/stripe_keys.dart';
import 'package:nectar/core/utils/app_routes.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:nectar/core/utils/constants.dart';
import 'package:nectar/core/utils/service_locator.dart';
import 'package:nectar/features/checkout/data/repos/cart%20repo/cart_repo_imp.dart';
import 'package:nectar/features/home/presentation/manager/change%20favourite%20cubit/change_favourite_cubit.dart';
import 'package:nectar/features/profile/presentation/manager/phone%20auth%20cubit/phone_auth_cubit.dart';
import 'package:nectar/features/profile/presentation/manager/uploud%20image%20cubit/uploud_image_cubit.dart';
import 'package:nectar/firebase_options.dart';
import 'core/function/config_loading.dart';
import 'features/authentication/presentation/manager/sign out cubit/sign_out_cubit.dart';
import 'features/checkout/presentation/manager/delete all carts cubit/delete_all_carts_cubit.dart';
import 'features/checkout/presentation/manager/get carts cubit/get_carts_cubit.dart';
import 'features/home/data/repos/shop_repo_imp.dart';
import 'features/home/presentation/manager/count total order cubit/count_total_order_cubit.dart';
import 'features/home/presentation/manager/get best selling/get_best_selling_cubit.dart';
import 'features/home/presentation/manager/get exclusive offer cubit/get_exclusive_offer_cubit.dart';
import 'features/home/presentation/manager/manage favourite cubit/manage_favourite_cubit.dart';
import 'features/home/presentation/manager/manage navigation cubit/manage_navigation_cubit.dart';
import 'features/home/presentation/manager/toggle images cubit/toggle_images_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/profile/data/models/user details model/user_details.dart';
import 'features/profile/data/repos/account repo/account_repo_imp.dart';
import 'features/profile/data/repos/image repo/image_repo_imp.dart';
import 'features/profile/presentation/manager/capture photo cubit/capture_photo_cubit.dart';
import 'features/profile/presentation/manager/get user details cubit/get_user_details_cubit.dart';
import 'features/profile/presentation/manager/pick image cubit/pick_image_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Stripe.publishableKey = PaymentKeys.publishablekey;
  Stripe.merchantIdentifier = 'string';
  await Stripe.instance.applySettings();
  await Hive.initFlutter();
  Hive.registerAdapter(UserDetailsModelAdapter());
  await Hive.openBox<UserDetailsModel>(kUserBox);
  setupServiceLocator();
  configLoading();
  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelKey: 'nectar',
            channelName: 'nectar store',
            channelDescription: 'store app for groceries products')
      ],
      debug: true);
  runApp(const NectarApp());
}

class NectarApp extends StatefulWidget {
  const NectarApp({super.key});

  @override
  State<NectarApp> createState() => _NectarAppState();
}

class _NectarAppState extends State<NectarApp> {
  @override
  void initState() {
    /*AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ManageFavouriteCubit(),
          ),
          BlocProvider(
            create: (context) => ChangeFavouriteCubit(),
          ),
          BlocProvider(
            create: (context) => ToggleImagesCubit(),
          ),
          BlocProvider(
            create: (context) => ManageFavouriteCubit(),
          ),
          BlocProvider(
            create: (context) => CapturePhotoCubit(ImageRepoImp()),
          ),
          BlocProvider(
            create: (context) => ManageNavigationCubit(),
          ),
          BlocProvider(create: (context) => SignOutCubit()),
          BlocProvider(
              create: (context) =>
                  GetBestSellingCubit(getIt.get<ShopRepoImp>())),
          BlocProvider(
              create: (context) =>
                  GetExclusiveOfferCubit(getIt.get<ShopRepoImp>())),
          BlocProvider(
              create: (context) => GetUserDetailsCubit(AccountRepoImp())),
          BlocProvider(
            create: (context) => PickImageCubit(ImageRepoImp()),
          ),
          BlocProvider(create: (context) => UploudImageCubit(ImageRepoImp())),
          BlocProvider(create: (context) => PhoneAuthCubit()),
          BlocProvider(create: (context) => CountTotalOrderCubit()),
          BlocProvider(create: (context) => GetCartsCubit(CartRepoImp())),
          BlocProvider(create: (context) => DeleteAllCartsCubit(CartRepoImp())),
        ],
        child: MaterialApp.router(
            routerConfig: AppRoutes.router,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: AppColors.oceanGreen, fontFamily: 'Gilroy'),
            builder: EasyLoading.init()),
      ),
    );
  }
}
